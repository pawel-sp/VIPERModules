//
//  ExampleModuleSetup.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 14.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

extension ExampleInteractor {
    
    typealias CustomDelegateType    = ExamplePresenter
    typealias CustomDataManagerType = ExampleDataManager
    
}

extension ExampleEventHandler {
    
    typealias CustomPresenterInterfaceType        = ExamplePresenter
    typealias CustomInteractorEventsInterfaceType = ExampleInteractor
    
}

extension ExamplePresenter {
    
    typealias CustomViewInterfaceType                 = ExampleViewController
    typealias CustomInteractorDataSourceInterfaceType = ExampleInteractor
    typealias CustomWireframeType                     = ExampleWireframe
    
}

extension ExampleViewController {
    
    typealias CustomPresenterInterfaceType    = ExamplePresenter
    typealias CustomEventHandlerInterfaceType = ExampleEventHandler
    
}

extension ExampleWireframe {
    
    typealias CustomViewInterfaceType         = ExampleViewController
    typealias CustomPresenterInterfaceType    = ExamplePresenter
    typealias CustomEventHandlerInterfaceType = ExampleEventHandler
    typealias CustomInteractorInterfaceType   = ExampleInteractor
    typealias CustomDataManagerType           = ExampleDataManager
    
}
