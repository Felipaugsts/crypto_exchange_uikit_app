//
//  ExchangeListInteractor.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.

import UIKit

// MARK: - ExchangeListInteractor Protocol

protocol ExchangeListInteractorProtocol: AnyObject {
    var presenter: ExchangeListPresenterProtocol? { get set }
    
    func loadScreenValues()
}

// MARK: - ExchangeListInteractor Implementation

class ExchangeListInteractor: ExchangeListInteractorProtocol {
    weak var presenter: ExchangeListPresenterProtocol?

    var service: ServiceProviderProtocol
    // MARK: - Initializer
    
    init(service: ServiceProviderProtocol = ServiceProvider.shared) {
        self.service = service
    }
    
    // MARK: - Public Methods
    
    func loadScreenValues() {
        loadExchangeData()
    }
    
    func loadExchangeData() {
        service.fetch([ExchangeListModel.APIResponse].self, endpoint: "exchanges", method: .get) { response in
            switch response {
            case .success(let resp):
                print(resp)
                self.presenter?.presentScreenValues(values: resp)
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
