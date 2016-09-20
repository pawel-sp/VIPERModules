//
//  ExampleDataManager.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 08.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import Foundation
import VIPERModules

class DataItemResource {
    
    var name:String
    
    init(name:String) {
        self.name = name
    }
    
}

class ExampleDataManager: VIPERDataManager {

    private var dataLimit:Int
    
    // MARK: - Init
    
    required init(dataLimit:Int) {
        self.dataLimit = dataLimit
        super.init()
    }
    
    required init() {
        fatalError("init() has not been implemented, use init(dataLimit:Int) instead")
    }
    
    // MARK: - Utilities
    
    func dataRequestWithCompletionBlock(block:@escaping (([DataItemResource]) -> Void)) {
        let deadlineTime = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            let dataCount = self.dataLimit
            let dataItems = (0..<dataCount).map({ DataItemResource(name: "item \($0)") })
            block(dataItems)
        }
    }
    
}
