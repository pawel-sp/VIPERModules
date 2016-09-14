//
//  ExampleModuleSetup.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 14.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

// MARK: - Extensions

extension ExampleInteractor {
    
    typealias CustomDelegateType    = ExamplePresenter
    typealias CustomDataManagerType = ExampleDataManager
    
}

extension ExampleEventHandler {
    
    typealias CustomPresenterType        = ExamplePresenter
    typealias CustomInteractorEventsType = ExampleInteractor
    
}

extension ExamplePresenter {
    
    typealias CustomViewControllerType       = ExampleViewController
    typealias CustomInteractorDataSourceType = ExampleInteractor
    typealias CustomWireframeType            = ExampleWireframe
    
}

extension ExampleViewController {
    
    typealias CustomPresenterType    = ExamplePresenter
    typealias CustomEventHandlerType = ExampleEventHandler
    
}

extension ExampleWireframe {
    
    typealias CustomViewInterfaceType         = ExampleViewController
    typealias CustomPresenterInterfaceType    = ExamplePresenter
    typealias CustomEventHandlerInterfaceType = ExampleEventHandler
    typealias CustomInteractorInterfaceType   = ExampleInteractor
    typealias CustomDataManagerType           = ExampleDataManager
    
}
