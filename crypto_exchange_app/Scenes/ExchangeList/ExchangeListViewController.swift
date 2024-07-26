//
//  ExchangeListViewController.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.

import UIKit
import SnapKit
import UIView_Shimmer

// MARK: - Protocol

protocol ExchangeListViewControllerProtocol: AnyObject {
    func displayScreenValues(_ values: ExchangeListModel.ScreenValues)
}

class ExchangeListViewController: UIViewController {
    
    // MARK: - Components
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(CustomExchangeCell.self, forCellWithReuseIdentifier: CustomExchangeCell.identifier)
        collection.backgroundColor = .black
        return collection
    }()
    
    var interactor: ExchangeListInteractorProtocol
    var presenter: ExchangeListPresenterProtocol
    var router: ExchangeListRouterProtocol
    
    public private(set) var datasource: [ExchangeListModel.APIResponse] = []
    
    // MARK: - Initializer
    
    init(interactor: ExchangeListInteractorProtocol = ExchangeListInteractor(),
         presenter: ExchangeListPresenterProtocol = ExchangeListPresenter(),
         router: ExchangeListRouterProtocol = ExchangeListRouter()) {
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
        setupLayout()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        interactor.presenter = presenter
        presenter.controller = self
        router.controller = self
    }
    
    private func setupLayout() {
        navigationItem.title = "Exchanges"
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalToSuperview()
        }
    }
}

// MARK: Protocol Implementation

extension ExchangeListViewController: ExchangeListViewControllerProtocol {
    
    func displayScreenValues(_ values: ExchangeListModel.ScreenValues) {
        datasource = values.datasource
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

// MARK: - Collection View

extension ExchangeListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 20
        return CGSize(width: width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomExchangeCell.identifier, for: indexPath) as? CustomExchangeCell else {
            return UICollectionViewCell()
        }
        
        if datasource.isEmpty {
            cell.setTemplateWithSubviews(true, animate: true)
        }
        
        let exchange = datasource[indexPath.row]
        cell.setup(data: exchange)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let exchange = datasource[indexPath.row]
        router.routeToExchange(data: exchange)
    }
}
