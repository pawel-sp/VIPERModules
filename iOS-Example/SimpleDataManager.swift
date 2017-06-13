//
//  SimpleDataManager.swift
//  iOS-Example
//
//  Created by Paweł Sporysz on 13.06.2017.
//  Copyright © 2017 Paweł Sporysz. All rights reserved.
//

import VIPERModules

struct DataItemResource {
    
    let name:String
    
}

class SimpleDataManager: VIPERDataManager, SimpleDataManagerInterface {
    
    private var dataLimit:Int
    
    // MARK: - Init
    
    required init(dataLimit:Int) {
        self.dataLimit = dataLimit
        super.init()
    }
    
    required convenience init() {
        self.init(dataLimit: 0)
    }
    
    // MARK: - SimpleDataManagerInterface
    
    func dataRequestWithCompletionBlock(_ block:@escaping (([DataItemResource]) -> Void)) {
        let deadlineTime = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            let dataCount = self.dataLimit
            let dataItems = (0..<dataCount).map({ DataItemResource(name: "item \($0)") })
            block(dataItems)
        }
    }
    
}
