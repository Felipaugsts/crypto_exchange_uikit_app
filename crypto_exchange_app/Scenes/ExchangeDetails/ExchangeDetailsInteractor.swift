//
//  ExchangeDetailsInteractor.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.

import UIKit

// MARK: - ExchangeDetailsInteractor Protocol

protocol ExchangeDetailsInteractorProtocol: AnyObject {
    var presenter: ExchangeDetailsPresenterProtocol? { get set }
    
    func loadScreenValues()
}

// MARK: - ExchangeDetailsInteractor Implementation

class ExchangeDetailsInteractor: ExchangeDetailsInteractorProtocol {
    weak var presenter: ExchangeDetailsPresenterProtocol?

    // MARK: - Initializer
    
    init() { }
    
    // MARK: - Public Methods
    
    func loadScreenValues() {
        presenter?.presentScreenValues()
    }
}
