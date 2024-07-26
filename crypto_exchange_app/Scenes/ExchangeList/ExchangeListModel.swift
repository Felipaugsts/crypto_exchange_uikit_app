//
//  ExchangeListModel.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.

import UIKit

// MARK: - ExchangeListModel

enum ExchangeListModel {
	struct ScreenValues {
        var datasource: [ExchangeListModel.APIResponse]
	}
    
    struct APIResponse: Codable {
        let exchange_id: String?
        let website: String?
        let name: String?
        let data_quote_start: String?
        let data_quote_end: String?
        let data_orderbook_start: String?
        let data_orderbook_end: String?
        let data_trade_start: String?
        let data_trade_end: String?
        let data_symbols_count: Int?
        let volume_1hrs_usd: Double?
        let volume_1day_usd: Double?
        let volume_1mth_usd: Double?
        let metric_id: [String]?

        enum CodingKeys: String, CodingKey {
            case exchange_id
            case website
            case name
            case data_quote_start
            case data_quote_end
            case data_orderbook_start
            case data_orderbook_end
            case data_trade_start
            case data_trade_end
            case data_symbols_count
            case volume_1hrs_usd
            case volume_1day_usd
            case volume_1mth_usd
            case metric_id
        }
    }
}
