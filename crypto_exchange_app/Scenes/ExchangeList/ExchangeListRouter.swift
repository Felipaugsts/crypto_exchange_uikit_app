//
//  ExchangeListRouter.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.

import UIKit

// MARK: - ExchangeListRouter Protocol

protocol ExchangeListRouterProtocol: AnyObject {
    var controller: UIViewController? { get set }
}

// MARK: - ExchangeListRouter Implementation

class ExchangeListRouter: ExchangeListRouterProtocol {
    weak var controller: UIViewController?

    // MARK: - Initializer
    
    init() { }
}
