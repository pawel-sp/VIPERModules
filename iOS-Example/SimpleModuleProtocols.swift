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

protocol SimpleViewInterface: VIPERViewInterface {
    
    func displayNavigationBarTitle(_ title:String) 
    func reloadTableView()
    
}

protocol SimplePresenterInterface: VIPERPresenterInterface {
    
    func updateViewTitle()
    func numberOfRows() -> Int
    func titleForRow(at indexPath:IndexPath) -> String
    
}

protocol SimpleEventHandlerInterface: VIPEREventHandlerInterface {
    
    func viewDidLoad()
    
}

protocol SimpleInteractorDataSourceInterface: VIPERInteractorDataSourceInterface {
    
    func dataCount() -> Int
    func titleForData(at index:Int) -> String 
    
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
