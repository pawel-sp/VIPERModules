//
//  SimpleInteractorEventsTestCase.swift
//  iOS-Example
//
//  Created by Paweł Sporysz on 13.06.2017.
//  Copyright © 2017 Paweł Sporysz. All rights reserved.
//

import XCTest
import VIPERModules
@testable import iOS_Example

class SimpleInteractorEventsTestCase: XCTestCase {
    
    // MARK: - Helpers
    
    class MockSimpleDataManager: SimpleDataManager {
        
        // MARK: - Properties
        
        var dataRequestCounter:Int = 0
        
        // MARK: - Overrides
        
        override func dataRequestWithCompletionBlock(_ block: @escaping (([DataItemResource]) -> Void)) {
            dataRequestCounter += 1
        }
        
    }
    
    // MARK: - Properties
    
    var interactorDataSource:SimpleInteractor!
    var mockDataManager:MockSimpleDataManager!
    
    // MARK: - Overrides
    
    override func setUp() {
        super.setUp()
        interactorDataSource = SimpleInteractor()
        mockDataManager      = MockSimpleDataManager()
        
        interactorDataSource._dataManager = mockDataManager
    }
    
    // MARK: - Tests
    
    func testLoadingDataInvokesDataRequest() {
        interactorDataSource.loadData()
        XCTAssertEqual(mockDataManager.dataRequestCounter, 1)
    }
    
}
