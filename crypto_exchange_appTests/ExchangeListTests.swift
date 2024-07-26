//
//  ExchangeListTests.swift
//  ExchangeListTests
//
//  Created by Felipe Augusto Silva on 25/07/24.
//

import XCTest
@testable import crypto_exchange_app

final class ExchangeListTests: XCTestCase {
    
    private var interactor: ExchangeListInteractor!
    private var controller: ExchangeListViewController!
    private var service: NetworkServiceMock!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        
        service = NetworkServiceMock()
        interactor = ExchangeListInteractor(service: service)
        controller = ExchangeListViewController(interactor: interactor)
        
        _ = controller.view
        
        configureMockResponses()
    }
    
    override func tearDown() {
        interactor = nil
        controller = nil
        service = nil
        
        super.tearDown()
    }
    
    func testExchangeListViewControllerDisplaysData() {
        // Given
        let expectation = self.expectation(description: "Fetch exchange data")
        
        // When
        interactor.loadScreenValues()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertEqual(self.controller.datasource.first?.name, "Binance")
            XCTAssertEqual(self.controller.datasource.first?.volume_1hrs_usd, 238181283.6)
            XCTAssertEqual(self.controller.datasource.count, 1)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2.0, handler: nil)
    }
    
    // MARK: - Setup Mock
    
    
    private func configureMockResponses() {
        // Example of configuring mock data
        let mockExchangeData = ExchangeListModel.APIResponse(
            exchange_id: "BINANCE",
            website: "https://www.binance.com/",
            name: "Binance",
            data_quote_start: "2017-12-18T00:00:00.0000000Z",
            data_quote_end: "2024-07-24T00:00:00.0000000Z",
            data_orderbook_start: "2017-12-18T21:50:58.3910192Z",
            data_orderbook_end: "2023-07-07T00:00:00.0000000Z",
            data_trade_start: "2017-07-14T00:00:00.0000000Z",
            data_trade_end: "2024-07-24T00:00:00.0000000Z",
            data_symbols_count: 2720,
            volume_1hrs_usd: 238181283.6,
            volume_1day_usd: 2218189785.13,
            volume_1mth_usd: 387749587595.3,
            metric_id: nil
        )
        
        // Set mock success response
        service.apiMockSuccessResponse = [mockExchangeData]
    }
}
