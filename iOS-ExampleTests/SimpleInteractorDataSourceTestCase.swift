//
//  SimpleInteractorDataSourceTestCase.swift
//  iOS-Example
//
//  Created by Paweł Sporysz on 13.06.2017.
//  Copyright © 2017 Paweł Sporysz. All rights reserved.
//

import XCTest
import VIPERModules
@testable import iOS_Example

class SimpleInteractorDataSourceTestCase: XCTestCase {
    
    // MARK: - Helpers
    
    class StubSimpleDataManager: SimpleDataManager {
        
        // MARK: - Properties
        
        var stubResult:[DataItemResource] = []
        
        // MARK: - Overrides
        
        override func dataRequestWithCompletionBlock(_ block: @escaping (([DataItemResource]) -> Void)) {
            block(stubResult)
        }
        
    }
    
    // MARK: - Properties
    
    var interactorDataSource:SimpleInteractor!
    var stubDataManager:StubSimpleDataManager!
    
    // MARK: - Overrides
    
    override func setUp() {
        super.setUp()
        interactorDataSource = SimpleInteractor()
        stubDataManager      = StubSimpleDataManager()
        
        interactorDataSource._dataManager = stubDataManager
        
        stubDataManager.stubResult = [
            DataItemResource(name: "1"),
            DataItemResource(name: "2"),
        ]
        
        interactorDataSource.loadData()
    }
    
    // MARK: - Tests
    
    func testDataCountReturnsNumberOfFetchedItems() {
        XCTAssertEqual(interactorDataSource.dataCount(), 2)
    }
    
    func testTitleForDataReturnsCorrectName() {
        XCTAssertEqual(interactorDataSource.titleForData(at: 0), "1")
        XCTAssertEqual(interactorDataSource.titleForData(at: 1), "2")
    }

}
