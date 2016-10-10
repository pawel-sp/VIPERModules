//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Untitled Kingdom on ___DATE___.
//___COPYRIGHT___
//

import VIPERModules

extension ___FILEBASENAMEASIDENTIFIER___Interactor {
    
    typealias CustomDelegateType    = ___FILEBASENAMEASIDENTIFIER___Presenter
    typealias CustomDataManagerType = ___FILEBASENAMEASIDENTIFIER___DataManager
    
}

extension ___FILEBASENAMEASIDENTIFIER___EventHandler {
    
    typealias CustomPresenterType        = ___FILEBASENAMEASIDENTIFIER___Presenter
    typealias CustomInteractorEventsType = ___FILEBASENAMEASIDENTIFIER___Interactor
    
}

extension ___FILEBASENAMEASIDENTIFIER___Presenter {
    
    typealias CustomViewControllerType       = ___FILEBASENAMEASIDENTIFIER___CollectionViewController
    typealias CustomInteractorDataSourceType = ___FILEBASENAMEASIDENTIFIER___Interactor
    typealias CustomWireframeType            = ___FILEBASENAMEASIDENTIFIER___Wireframe
    
}

extension ___FILEBASENAMEASIDENTIFIER___CollectionViewController {
    
    typealias CustomPresenterType    = ___FILEBASENAMEASIDENTIFIER___Presenter
    typealias CustomEventHandlerType = ___FILEBASENAMEASIDENTIFIER___EventHandler
    
}

extension ___FILEBASENAMEASIDENTIFIER___Wireframe {
    
    typealias CustomViewInterfaceType         = ___FILEBASENAMEASIDENTIFIER___CollectionViewController
    typealias CustomPresenterInterfaceType    = ___FILEBASENAMEASIDENTIFIER___Presenter
    typealias CustomEventHandlerInterfaceType = ___FILEBASENAMEASIDENTIFIER___EventHandler
    typealias CustomInteractorInterfaceType   = ___FILEBASENAMEASIDENTIFIER___Interactor
    typealias CustomDataManagerType           = ___FILEBASENAMEASIDENTIFIER___DataManager
    
}
