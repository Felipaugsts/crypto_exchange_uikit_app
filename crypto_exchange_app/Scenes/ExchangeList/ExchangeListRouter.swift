//
//  ExchangeListRouter.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.

import UIKit

// MARK: - ExchangeListRouter Protocol

protocol ExchangeListRouterProtocol: AnyObject {
    var controller: UIViewController? { get set }
    
    func routeToExchange(data: ExchangeListModel.APIResponse)
}

// MARK: - ExchangeListRouter Implementation

class ExchangeListRouter: ExchangeListRouterProtocol {
    weak var controller: UIViewController?

    func routeToExchange(data: ExchangeListModel.APIResponse) {
        let view = ExchangeDetailsViewController(exchangeData: data)
        controller?.navigationController?.pushViewController(view, animated: true)
    }
}
