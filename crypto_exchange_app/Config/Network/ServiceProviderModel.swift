//
//  ServiceProviderModel.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.
//

import Foundation

public enum RequestHTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

public enum APIError: Error {
    case invalidResponse
    case invalidData
    case badURL, requestFailed(_ statusCode: Int, _ reason: String, _ response: HTTPURLResponse?, _ data: Any?), mappingError, tokenError, noConnection, customError(statusCode: Int, result: Any?), unknown
}
