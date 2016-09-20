//
//  ExampleModuleProtocols.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 08.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import Foundation

protocol ExampleWireframeInterface: VIPERCustomWireframeInterface {
    
}

protocol ExampleViewInterface: VIPERCustomViewInterface {
    
    func displayNavigationBarTitle(title:String)
    func reloadTableView()
    
}

protocol ExamplePresenterInterface: VIPERCustomPresenterInterface {
    
    func updateViewTitle()
    func numberOfRows() -> Int
    func titleForRowAtIndexPath(indexPath:IndexPath) -> String
    
}

protocol ExampleEventHandlerInterface: VIPERCustomEventHandlerInterface {
    
    func viewDidLoad()
    
}

protocol ExampleInteractorEventsInterface: VIPERCustomInteractorEventsInterface {
    
    func loadData()
    
}

protocol ExampleInteractorDataSourceInterface: VIPERCustomInteractorDataSourceInterface {
    
    func dataCount() -> Int
    func titleForDataAtIndex(index:Int) -> String
    
}

protocol ExampleInteractorDelegate: VIPERCustomInteractorDelegate {
    
    func loadedData()
    
}
