//
//  ExchangeDetailsPresenter.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.

import UIKit

// MARK: - ExchangeDetailsPresenter Protocol

protocol ExchangeDetailsPresenterProtocol: AnyObject {
    var controller: ExchangeDetailsViewControllerProtocol? { get set }
    
    func presentScreenValues(exchange: ExchangeListModel.APIResponse)
}

// MARK: - ExchangeDetailsPresenter Implementation

class ExchangeDetailsPresenter: ExchangeDetailsPresenterProtocol {
    weak var controller: ExchangeDetailsViewControllerProtocol?
    
    // MARK: - Public Methods
    
    func presentScreenValues(exchange: ExchangeListModel.APIResponse) {
        let values = ExchangeDetailsModel.ScreenValues(
            exchange: exchange.name ?? "N/A",
            exchangeID: "Exchange ID: \(exchange.exchange_id ?? "N/A")",
            website: "Website: \(exchange.website ?? "N/A")",
            quote: formatQuoteRange(start: exchange.data_quote_start, end: exchange.data_quote_end),
            volume: formatVolume(volume: exchange.volume_1hrs_usd)
        )
        controller?.displayScreenValues(values)
    }

    private func formatQuoteRange(start: String?, end: String?) -> String {
        guard let start = start, let end = end else {
            return "Quote Range: N/A"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"
        let startDate = dateFormatter.date(from: start) ?? Date()
        let endDate = dateFormatter.date(from: end) ?? Date()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        let startFormatted = dateFormatter.string(from: startDate)
        let endFormatted = dateFormatter.string(from: endDate)
        return "Quote Range: \(startFormatted) - \(endFormatted)"
    }

    private func formatVolume(volume: Double?) -> String {
        guard let volume = volume else {
            return "Volume (1 hr): N/A"
        }
        return String(format: "Volume (1 hr): $%.2f", volume)
    }

}
