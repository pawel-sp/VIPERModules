//
//  ExampleDataManager.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 08.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import Foundation

class DataItemResource {
    
    var name:String
    
    init(name:String) {
        self.name = name
    }
    
}

class ExampleDataManager: VIPERDataManager {

    func dataRequestWithCompletionBlock(block:@escaping (([DataItemResource]) -> Void)) {
        let deadlineTime = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            let dataCount = 10
            let dataItems = (0..<dataCount).map({ DataItemResource(name: "item \($0)") })
            block(dataItems)
        }
    }
    
}
