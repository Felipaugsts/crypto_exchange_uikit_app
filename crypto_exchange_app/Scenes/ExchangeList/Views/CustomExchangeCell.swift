//
//  CustomExchangeCell.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.
//

import UIView_Shimmer
import UIKit
import SnapKit

class CustomExchangeCell: UICollectionViewCell {
    
    // MARK: - Components
    
    private let nameLabel = UILabel()
    private let exchangeIDLabel = UILabel()
    private let websiteLabel = UILabel()
    private let volumeTitleLabel = UILabel()
    private let volumeLabel = UILabel()
    
    static let identifier = "CustomExchangeCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        contentView.backgroundColor = .darkGray
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        // Add subviews
        contentView.addSubview(nameLabel)
        contentView.addSubview(exchangeIDLabel)
        contentView.addSubview(websiteLabel)
        contentView.addSubview(volumeTitleLabel)
        contentView.addSubview(volumeLabel)
        
        // Configure labels
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.textColor = .white
        nameLabel.numberOfLines = 1
        
        exchangeIDLabel.font = UIFont.systemFont(ofSize: 14)
        exchangeIDLabel.textColor = .lightGray
        exchangeIDLabel.numberOfLines = 1
        
        websiteLabel.font = UIFont.systemFont(ofSize: 14)
        websiteLabel.textColor = .lightGray
        websiteLabel.numberOfLines = 1
        
        volumeTitleLabel.font = UIFont.systemFont(ofSize: 14)
        volumeTitleLabel.textColor = .lightGray
        volumeTitleLabel.text = "Volume (1 hr)"
        volumeTitleLabel.numberOfLines = 1
        
        volumeLabel.font = UIFont.boldSystemFont(ofSize: 16)
        volumeLabel.textColor = .white
        volumeLabel.numberOfLines = 1
        
        // Set up constraints
        nameLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }
        
        exchangeIDLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        websiteLabel.snp.makeConstraints { make in
            make.top.equalTo(exchangeIDLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        volumeTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(websiteLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(16)
        }
        
        volumeLabel.snp.makeConstraints { make in
            make.top.equalTo(volumeTitleLabel.snp.bottom).offset(4)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    
    func setup(data: ExchangeListModel.APIResponse) {
        nameLabel.text = data.name ?? "N/A"
        exchangeIDLabel.text = "ID: \(data.exchange_id ?? "N/A")"
        websiteLabel.text = "Website: \(data.website ?? "N/A")"
        
        // Format volume with comma separator and add currency symbol
        if let volume = data.volume_1hrs_usd {
            volumeLabel.text = String(format: "$%.2f", volume)
        } else {
            volumeLabel.text = "N/A"
        }
    }
}
