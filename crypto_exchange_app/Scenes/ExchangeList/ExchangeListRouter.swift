//
//  ExchangeListRouter.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.

import UIKit

// MARK: - ExchangeListRouter Protocol

public protocol ExchangeListRouterProtocol: AnyObject {
    var controller: UIViewController? { get set }
}

// MARK: - ExchangeListRouter Implementation

public class ExchangeListRouter: ExchangeListRouterProtocol {
    public weak var controller: UIViewController?

    // MARK: - Initializer
    
    public init() { }
}
