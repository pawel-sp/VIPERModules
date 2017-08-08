//
//  SimpleModuleBuilder.swift
//  iOS-Example
//
//  Created by Paweł Sporysz on 13.06.2017.
//  Copyright © 2017 Paweł Sporysz. All rights reserved.
//

import VIPERModules

class SimpleModuleBuilder: VIPERModuleBuilderInterface {
    
    typealias WireframeInterface             = SimpleWireframeInterface
    typealias ViewInterace                   = SimpleViewInterface
    typealias ViewModel                      = SimpleViewModel // or SimpleViewModelInterface
    typealias PresenterInterface             = SimplePresenterInterface
    typealias EventHandlerInterface          = SimpleEventHandlerInterface
    typealias InteractorDataSourceInterface  = SimpleInteractorDataSourceInterface
    typealias InteractorEventsInterface      = SimpleInteractorEventsInterface
    typealias InteractorEventsDelegate       = SimpleInteractorEventsDelegate
    typealias DataManagerInterface           = SimpleDataManagerInterface
    
    static func module() -> Module {
        return module(
            wireframeType: SimpleWireframe.self,
            viewInterfaceType: SimpleViewController.self,
            presenterType: SimplePresenter.self,
            eventHandlerType: SimpleEventHandler.self,
            interactorType: SimpleInteractor.self,
            dataManagerType: SimpleDataManager.self,
            dataManagerInitBlock: { $0.init(dataLimit: 5) }
        )
    }
    
}
