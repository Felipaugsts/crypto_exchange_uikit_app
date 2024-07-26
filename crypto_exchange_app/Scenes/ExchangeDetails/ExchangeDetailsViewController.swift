//
//  ExchangeDetailsViewController.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.

import UIKit

// MARK: - Protocol

protocol ExchangeDetailsViewControllerProtocol: AnyObject {
    func displayScreenValues(_ values: ExchangeDetailsModel.ScreenValues)
}

class ExchangeDetailsViewController: UIViewController {
    
    var interactor: ExchangeDetailsInteractorProtocol
    var presenter: ExchangeDetailsPresenterProtocol
    var router: ExchangeDetailsRouterProtocol
    
    // MARK: - Initializer
    
    init(interactor: ExchangeDetailsInteractorProtocol = ExchangeDetailsInteractor(),
         presenter: ExchangeDetailsPresenterProtocol = ExchangeDetailsPresenter(),
         router: ExchangeDetailsRouterProtocol = ExchangeDetailsRouter()) {
        self.interactor = interactor
        self.presenter = presenter
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.loadScreenValues()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        interactor.presenter = presenter
        presenter.controller = self
        router.controller = self
    }
}

// MARK: Protocol Implementation

extension ExchangeDetailsViewController: ExchangeDetailsViewControllerProtocol {
    
    func displayScreenValues(_ values: ExchangeDetailsModel.ScreenValues) {
        
    }
}
