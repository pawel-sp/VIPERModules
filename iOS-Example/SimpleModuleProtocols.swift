//
//  SimpleModuleProtocols.swift
//  iOS-Example
//
//  Created by Paweł Sporysz on 13.06.2017.
//  Copyright © 2017 Paweł Sporysz. All rights reserved.
//

import VIPERModules

protocol SimpleWireframeInterface: VIPERWireframeInterface {
    
}

protocol SimpleViewInterface: VIPERViewModelsInterface {
    
    func displayNavigationBarTitle(_ title:String) 
    func reloadTableView()
    
}

protocol SimplePresenterInterface: VIPERPresenterInterface {
    
    func updateViewTitle()
    
}

protocol SimpleEventHandlerInterface: VIPEREventHandlerInterface {
    
    func viewDidLoad()
    
}

protocol SimpleInteractorDataSourceInterface: VIPERInteractorDataSourceInterface {
    
    var fetchedDataInfo:[DataItemInfo]? { get }
    
}

protocol SimpleInteractorEventsInterface: VIPERInteractorEventsInterface {
    
    func loadData()
    
}

protocol SimpleInteractorEventsDelegate: VIPERInteractorEventsDelegate {
    
    func loadedData()
    
}

protocol SimpleDataManagerInterface: VIPERDataManagerInterface {
    
    func dataRequestWithCompletionBlock(_ block:@escaping (([DataItemResource]) -> Void))
    
}
