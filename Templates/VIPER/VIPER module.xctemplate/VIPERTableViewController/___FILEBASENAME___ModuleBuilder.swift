//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import VIPERModules

class ___VARIABLE_moduleName___ModuleBuilder: VIPERModuleBuilderInterface {
    
    typealias WireframeInterface             = ___VARIABLE_moduleName___WireframeInterface
    typealias ViewInterace                   = ___VARIABLE_moduleName___ViewInterface
    typealias PresenterInterface             = ___VARIABLE_moduleName___PresenterInterface
    typealias EventHandlerInterface          = ___VARIABLE_moduleName___EventHandlerInterface
    typealias InteractorDataSourceInterface  = ___VARIABLE_moduleName___InteractorDataSourceInterface
    typealias InteractorEventsInterface      = ___VARIABLE_moduleName___InteractorEventsInterface
    typealias InteractorEventsDelegate       = ___VARIABLE_moduleName___InteractorEventsDelegate
    typealias DataManagerInterface           = ___VARIABLE_moduleName___DataManagerInterface
    
    static func module() -> Module {
        return module(
            wireframeType: ___VARIABLE_moduleName___Wireframe.self,
            viewInterfaceType: ___VARIABLE_moduleName___ViewController.self,
            presenterType: ___VARIABLE_moduleName___Presenter.self,
            eventHandlerType: ___VARIABLE_moduleName___EventHandler.self,
            interactorType: ___VARIABLE_moduleName___Interactor.self,
            dataManagerType: ___VARIABLE_moduleName___DataManager.self
        )
    }
    
}
