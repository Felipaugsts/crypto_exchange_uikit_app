//
//  NetworkServiceMock.swift
//  crypto_exchange_appTests
//
//  Created by Felipe Augusto Silva on 26/07/24.
//

import Foundation
@testable import crypto_exchange_app

class NetworkServiceMock: ServiceProviderProtocol {
    var baseURL: String?
    
    // Define the mock response and error
    var apiMockSuccessResponse: Any?
    var apiMockError: APIError?
    
    func fetch<T: Decodable>(_ model: T.Type, endpoint: String, method: crypto_exchange_app.RequestHTTPMethod, completionHandler: @escaping (Result<T, crypto_exchange_app.APIError>) -> Void) {
        if let response = apiMockSuccessResponse as? T {
            completionHandler(.success(response))
        } else if let error = apiMockError {
            completionHandler(.failure(error))
        } else {
            completionHandler(.failure(.invalidData))
        }
    }
}

