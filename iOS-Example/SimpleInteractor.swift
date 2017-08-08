//
//  SimpleInteractor.swift
//  iOS-Example
//
//  Created by Paweł Sporysz on 13.06.2017.
//  Copyright © 2017 Paweł Sporysz. All rights reserved.
//

import VIPERModules

struct DataItemInfo {
    
    let title:String
    
}

class SimpleInteractor: VIPERInteractor<SimpleModuleBuilder>, SimpleInteractorDataSourceInterface, SimpleInteractorEventsInterface {
    
    // MARK: - Properties
    
    private var fetchedData:[DataItemResource]?
    
    // MARK: - SimpleInteractorEventsInterface
    
    func loadData() {
        dataManager.dataRequestWithCompletionBlock { data in
            self.fetchedData = data
            self.delegate?.loadedData()
        }
    }
    
    // MARK: - SimpleInteractorDataSourceInterface
    
    var fetchedDataInfo:[DataItemInfo]? {
        return fetchedData?.map({ DataItemInfo(title: $0.name) })
    }
    
}
