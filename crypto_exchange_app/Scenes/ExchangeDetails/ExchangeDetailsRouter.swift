//
//  ExchangeDetailsRouter.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.

import UIKit

// MARK: - ExchangeDetailsRouter Protocol

protocol ExchangeDetailsRouterProtocol: AnyObject {
    var controller: UIViewController? { get set }
}

// MARK: - ExchangeDetailsRouter Implementation

class ExchangeDetailsRouter: ExchangeDetailsRouterProtocol {
    weak var controller: UIViewController?

    // MARK: - Initializer
    
    init() { }
}
