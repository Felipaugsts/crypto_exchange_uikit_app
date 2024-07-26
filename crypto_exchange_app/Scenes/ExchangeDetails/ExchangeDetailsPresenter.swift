//
//  ExchangeDetailsPresenter.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.

import UIKit

// MARK: - ExchangeDetailsPresenter Protocol

protocol ExchangeDetailsPresenterProtocol: AnyObject {
    var controller: ExchangeDetailsViewControllerProtocol? { get set }
    
    func presentScreenValues()
}

// MARK: - ExchangeDetailsPresenter Implementation

class ExchangeDetailsPresenter: ExchangeDetailsPresenterProtocol {
    weak var controller: ExchangeDetailsViewControllerProtocol?

    // MARK: - Initializer
    
    init() { }
    
    // MARK: - Public Methods
    
    func presentScreenValues() {
        let values = ExchangeDetailsModel.ScreenValues(example: "example")
        controller?.displayScreenValues(values)
    }
}
