//
//  SimplePresenter.swift
//  iOS-Example
//
//  Created by Paweł Sporysz on 13.06.2017.
//  Copyright © 2017 Paweł Sporysz. All rights reserved.
//

import VIPERModules

class SimplePresenter: VIPERPresenter<SimpleModuleBuilder>, SimplePresenterInterface, SimpleInteractorEventsDelegate {
    
    // MARK: - SimplePresenterInterface
    
    func updateViewTitle() {
        viewInterface?.displayNavigationBarTitle("Simple Module")
    }
    
    func numberOfRows() -> Int {
        return interactorDataSource.dataCount()
    }
    
    func titleForRow(at indexPath:IndexPath) -> String {
        return interactorDataSource.titleForData(at: indexPath.row)
    }
    
    // MARK: - SimpleInteractorEventsDelegate
    
    func loadedData() {
        viewInterface?.reloadTableView()
    }
    
}
