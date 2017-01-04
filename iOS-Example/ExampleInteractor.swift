//
//  ExampleInteractor.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 08.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import Foundation
import VIPERModules

class ExampleInteractor: VIPERInteractor, ExampleInteractorEventsInterface, ExampleInteractorDataSourceInterface {

    // MARK: - Properties
    
    fileprivate var fetchedData:[DataItemResource] = []

    // MARK: - ExampleInteractorEventsInterface
    
    func loadData() {
        dataManager.dataRequestWithCompletionBlock { [weak self] data in
            self?.fetchedData = data
            self?.delegate.loadedData()
        }
    }
    
    // MARK: - ExampleInteractorDataSourceInterface
    
    func dataCount() -> Int {
        return fetchedData.count
    }
    
    func titleForDataAtIndex(_ index:Int) -> String {
        return fetchedData[index].name
    }
    
}
