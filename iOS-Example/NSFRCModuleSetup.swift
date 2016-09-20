//
//  NSFRCModuleSetup.swift
//  ViperModuleGenerator
//
//  Created by Untitled Kingdom on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

extension NSFRCInteractor {
    
    typealias CustomDelegateType    = NSFRCPresenter
    typealias CustomDataManagerType = NSFRCDataManager
    
}

extension NSFRCEventHandler {
    
    typealias CustomPresenterType        = NSFRCPresenter
    typealias CustomInteractorEventsType = NSFRCInteractor
    
}

extension NSFRCPresenter {
    
    typealias CustomViewControllerType       = NSFRCTableViewController
    typealias CustomInteractorDataSourceType = NSFRCInteractor
    typealias CustomWireframeType            = NSFRCWireframe
    
}

extension NSFRCTableViewController {
    
    typealias CustomPresenterType    = NSFRCPresenter
    typealias CustomEventHandlerType = NSFRCEventHandler
    
}

extension NSFRCWireframe {
    
    typealias CustomViewInterfaceType         = NSFRCTableViewController
    typealias CustomPresenterInterfaceType    = NSFRCPresenter
    typealias CustomEventHandlerInterfaceType = NSFRCEventHandler
    typealias CustomInteractorInterfaceType   = NSFRCInteractor
    typealias CustomDataManagerType           = NSFRCDataManager
    
}
