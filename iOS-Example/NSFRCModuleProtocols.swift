//
//  NSFRCModuleProtocols.swift
//  ViperModuleGenerator
//
//  Created by Untitled Kingdom on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import Foundation
import VIPERModules

protocol NSFRCWireframeInterface: VIPERCustomWireframeInterface {
    
}

protocol NSFRCViewInterface: VIPERCustomViewInterface, VIPERFetchResultControllerViewInterface {
    
}

protocol NSFRCPresenterInterface: VIPERCustomPresenterInterface {
    
    func numberOfRows() -> Int
    func titleForRowAtIndexPath(_ indexPath:IndexPath) -> String
    
}

protocol NSFRCEventHandlerInterface: VIPERCustomEventHandlerInterface {
    
    func viewDidLoad()
    func didSelectAddButton()
    
}

protocol NSFRCInteractorEventsInterface: VIPERCustomInteractorEventsInterface, VIPERFetchResultControllerInteractorEventsInterface {
    
    func fetchPersons()
    func addRandomPerson()
    
}

protocol NSFRCInteractorDataSourceInterface: VIPERCustomInteractorDataSourceInterface {
    
    func numberOfPersons() -> Int
    func personInfoAtIndex(_ index:Int) -> PersonInfo?
    
}

protocol NSFRCInteractorDelegate: VIPERCustomInteractorDelegate, VIPERFetchResultControllerInteractorEventsDelegate {
    
}

