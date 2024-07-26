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
    
    // MARK: - Components
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let websiteLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let detailsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 10
        view.layer.masksToBounds = false
        return view
    }()
    
    private let exchangeIDLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        label.numberOfLines = 1
        return label
    }()
    
    private let dataQuoteRangeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private let volumeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    private var exchangeData: ExchangeListModel.APIResponse?
    
    var interactor: ExchangeDetailsInteractorProtocol
    var presenter: ExchangeDetailsPresenterProtocol
    var router: ExchangeDetailsRouterProtocol
    
    // MARK: - Initializer
    
    init(interactor: ExchangeDetailsInteractorProtocol = ExchangeDetailsInteractor(),
         presenter: ExchangeDetailsPresenterProtocol = ExchangeDetailsPresenter(),
         router: ExchangeDetailsRouterProtocol = ExchangeDetailsRouter(),
         exchangeData: ExchangeListModel.APIResponse) {
        self.interactor = interactor
        self.presenter = presenter
        self.router = router
        self.exchangeData = exchangeData
        
        super.init(nibName: nil, bundle: nil)
        
        setup()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.loadScreenValues(exchange: exchangeData)
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        interactor.presenter = presenter
        presenter.controller = self
        router.controller = self
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        view.backgroundColor = .black
        view.addSubview(headerView)
        view.addSubview(detailsView)
        
        // Add subviews to headerView
        headerView.addSubview(nameLabel)
        headerView.addSubview(websiteLabel)
        
        // Add subviews to detailsView
        detailsView.addSubview(exchangeIDLabel)
        detailsView.addSubview(dataQuoteRangeLabel)
        detailsView.addSubview(volumeLabel)
    }
    
    private func setupConstraints() {
        headerView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(20)
            make.top.equalTo(view).inset(120)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(headerView).inset(16)
        }
        
        websiteLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalTo(headerView).inset(16)
        }
        
        detailsView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalTo(view).inset(20)
        }
        
        exchangeIDLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(detailsView).inset(16)
        }
        
        dataQuoteRangeLabel.snp.makeConstraints { make in
            make.top.equalTo(exchangeIDLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(detailsView).inset(16)
        }
        
        volumeLabel.snp.makeConstraints { make in
            make.top.equalTo(dataQuoteRangeLabel.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalTo(detailsView).inset(16)
        }
    }
}

// MARK: - Protocol Implementation

extension ExchangeDetailsViewController: ExchangeDetailsViewControllerProtocol {
    
    func displayScreenValues(_ values: ExchangeDetailsModel.ScreenValues) {
        nameLabel.text = values.exchange
        websiteLabel.text = values.website
        exchangeIDLabel.text = values.exchangeID
        dataQuoteRangeLabel.text = values.quote
        volumeLabel.text = values.volume
    }
}
