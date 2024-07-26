//
//  DateFormatter+Extension.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 26/07/24.
//

import Foundation

// MARK: - DateFormatter Extension

extension DateFormatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"
        return formatter
    }()
}
