//
//  ExchangeListPresenter.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.

import UIKit

// MARK: - ExchangeListPresenter Protocol

protocol ExchangeListPresenterProtocol: AnyObject {
    var controller: ExchangeListViewControllerProtocol? { get set }
    
    func presentScreenValues(values: [ExchangeListModel.APIResponse])
}

// MARK: - ExchangeListPresenter Implementation

class ExchangeListPresenter: ExchangeListPresenterProtocol {
    
    weak var controller: ExchangeListViewControllerProtocol?

    // MARK: - Public Methods
    
    func presentScreenValues(values: [ExchangeListModel.APIResponse]) {
        let values = ExchangeListModel.ScreenValues(datasource: values)
        controller?.displayScreenValues(values)
    }
}
