//
//  HTTPRequestService.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.
//
import Foundation
import UIKit
import KeychainSwift

// MARK: - Protocol

protocol ServiceProviderProtocol {
    var baseURL: String? { get set }
    
    func fetch<T: Decodable>(_ model: T.Type, endpoint: String, method: RequestHTTPMethod, completionHandler: @escaping (Result<T, APIError>) -> Void)
}

public class ServiceProvider: ServiceProviderProtocol {
    private var keychain: KeychainSwift
    
    static var shared: ServiceProviderProtocol = ServiceProvider()
    
    // MARK: - Initializer
    
    init(keychain: KeychainSwift = KeychainSwift()) {
        self.keychain = keychain
    }
    
    // MARK: - Public Variables
    
    var baseURL: String?
    
    // MARK: - Private Variables
    
    private var apiToken: String? {
        get { keychain.get("apiToken") }
        set {
            if let newToken = newValue {
                keychain.set(newToken, forKey: "apiToken")
            }
        }
    }
    
    // MARK: - Public Methods
    
    func fetch<T: Decodable>(_ model: T.Type, endpoint: String, method: RequestHTTPMethod = .get, completionHandler: @escaping (Result<T, APIError>) -> Void) {
        
        // Ensure baseURL is not nil and construct the full URL
        guard let baseUrl = baseURL,
              let fullURL = URL(string: baseUrl + endpoint) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        var request = URLRequest(url: fullURL)
        
        // Set the HTTP method for the request
        request.httpMethod = method.rawValue
        
        // Retrieve and set the API token in the request headers
        guard let token = apiToken else {
            completionHandler(.failure(.customError(statusCode: 401, result: nil)))
            return
        }
        request.setValue(token, forHTTPHeaderField: "X-CoinAPI-Key")
        
        // Start the network request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                // Handle network error
                let failureReason = error.localizedDescription
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                completionHandler(.failure(.requestFailed(statusCode, failureReason, response as? HTTPURLResponse, nil)))
                return
            }
            
            guard let data = data else {
                // Handle missing data scenario
                completionHandler(.failure(.unknown))
                return
            }
            
            do {
                // Decode the response data into the expected model type
                let decodedModel = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(decodedModel))
            } catch {
                // Handle decoding errors
                print(error.localizedDescription)
                completionHandler(.failure(.mappingError))
            }
        }
        task.resume()
    }
}
