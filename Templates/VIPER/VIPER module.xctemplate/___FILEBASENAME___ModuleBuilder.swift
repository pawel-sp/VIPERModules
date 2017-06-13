//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by VIPERModules on ___DATE___.
//___COPYRIGHT___
//

import VIPERModules

class ___FILEBASENAMEASIDENTIFIER___ModuleBuilder: VIPERModuleBuilderInterface {
    
    typealias WireframeInterface             = ___FILEBASENAMEASIDENTIFIER___WireframeInterface
    typealias ViewInterace                   = ___FILEBASENAMEASIDENTIFIER___ViewInterface
    typealias PresenterInterface             = ___FILEBASENAMEASIDENTIFIER___PresenterInterface
    typealias EventHandlerInterface          = ___FILEBASENAMEASIDENTIFIER___EventHandlerInterface
    typealias InteractorDataSourceInterface  = ___FILEBASENAMEASIDENTIFIER___InteractorDataSourceInterface
    typealias InteractorEventsInterface      = ___FILEBASENAMEASIDENTIFIER___InteractorEventsInterface
    typealias InteractorEventsDelegate       = ___FILEBASENAMEASIDENTIFIER___InteractorEventsDelegate
    typealias DataManagerInterface           = ___FILEBASENAMEASIDENTIFIER___DataManagerInterface
    
    static func module() -> WireframeInterface {
        return module(
            wireframeType: ___FILEBASENAMEASIDENTIFIER___Wireframe.self,
            viewInterfaceType: ___FILEBASENAMEASIDENTIFIER___ViewController.self,
            presenterType: ___FILEBASENAMEASIDENTIFIER___Presenter.self,
            eventHandlerType: ___FILEBASENAMEASIDENTIFIER___EventHandler.self,
            interactorType: ___FILEBASENAMEASIDENTIFIER___Interactor.self,
            dataManagerType: ___FILEBASENAMEASIDENTIFIER___DataManager.self
        )
    }
    
}
