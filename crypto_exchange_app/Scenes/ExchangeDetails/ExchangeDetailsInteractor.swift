//
//  ExchangeDetailsInteractor.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.

import UIKit

// MARK: - ExchangeDetailsInteractor Protocol

protocol ExchangeDetailsInteractorProtocol: AnyObject {
    var presenter: ExchangeDetailsPresenterProtocol? { get set }
    
    func loadScreenValues(exchange: ExchangeListModel.APIResponse?)
}

// MARK: - ExchangeDetailsInteractor Implementation

class ExchangeDetailsInteractor: ExchangeDetailsInteractorProtocol {
    weak var presenter: ExchangeDetailsPresenterProtocol?
    
    private var exchange: ExchangeListModel.APIResponse?

    // MARK: - Public Methods
    
    func loadScreenValues(exchange: ExchangeListModel.APIResponse?) {
        guard let exchangeData = exchange else {
            return
        }
        self.exchange = exchangeData
        presenter?.presentScreenValues(exchange: exchangeData)
    }
}
