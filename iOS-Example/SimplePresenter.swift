//
//  SimplePresenter.swift
//  iOS-Example
//
//  Created by Paweł Sporysz on 13.06.2017.
//  Copyright © 2017 Paweł Sporysz. All rights reserved.
//

import VIPERModules

class SimplePresenter: VIPERVMSPresenter<SimpleModuleBuilder>, SimplePresenterInterface, SimpleInteractorEventsDelegate {
    
    // MARK: - SimplePresenterInterface
    
    func updateViewTitle() {
        viewInterface?.displayNavigationBarTitle("Simple Module")
    }
    
    // MARK: - SimpleInteractorEventsDelegate
    
    func loadedData() {
        viewInterfaceVMS = interactorDataSource.fetchedDataInfo?.map({ SimpleViewModel(title: $0.title) }) ?? []
        viewInterface?.reloadTableView()
    }
    
}
