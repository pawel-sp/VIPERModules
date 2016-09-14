//
//  VIPERModuleClasses.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 08.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class VIPERItem: NSObject {
    
    deinit {
        print("VIPER: \(type(of:self)) deallocated")
    }
    
}


class VIPERWireframe: VIPERItem, VIPERWireframeInterface {
    
    // MARK: - VIPERWireframeInterface
    
    func module<
        VIPERViewControllerType:VIPERViewInterface,
        VIPERPresenterType:VIPERPresenter,
        VIPEREventHandlerType:VIPEREventHandler,
        VIPERInteractorType:VIPERInteractor,
        VIPERDataManagerType:VIPERDataManager>
        (storyboard:UIStoryboard,
         viewControllerID:String,
         presenterType:VIPERPresenterType.Type,
         eventHandlerType:VIPEREventHandlerType.Type,
         interactorType:VIPERInteractorType.Type,
         dataManagerType:VIPERDataManagerType.Type,
         presenterInitBlock:((VIPERPresenterType.Type) -> (VIPERPresenterType))?,
         eventHandlerInitBlock:((VIPEREventHandlerType.Type) -> (VIPEREventHandlerType))?,
         interactorInitBlock:((VIPERInteractorType.Type) -> (VIPERInteractorType))?,
         dataManagerInitBlock:((VIPERDataManagerType.Type) -> (VIPERDataManagerType))?
        ) -> VIPERViewControllerType {
        
        let presenter      = presenterInitBlock?(presenterType) ?? presenterType.init()
        let eventHandler   = eventHandlerInitBlock?(eventHandlerType) ?? eventHandlerType.init()
        let interactor     = interactorInitBlock?(interactorType) ?? interactorType.init()
        let dataManager    = dataManagerInitBlock?(dataManagerType) ?? dataManagerType.init()
        
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerID) as! VIPERViewControllerType
        
        if let viperViewController = viewController as? VIPERViewController {
            viperViewController._presenter    = presenter
            viperViewController._eventHandler = eventHandler
        } else if let viperTableViewController = viewController as? VIPERTableViewController {
            viperTableViewController._presenter    = presenter
            viperTableViewController._eventHandler = eventHandler
        } else if let viperCollectionViewController = viewController as? VIPERCollectionViewController {
            viperCollectionViewController._presenter    = presenter
            viperCollectionViewController._eventHandler = eventHandler
        }
        
        presenter._viewInterface        = viewController
        presenter._interactorDataSource = interactor
        presenter._wireframe            = self
        
        eventHandler._presenter        = presenter
        eventHandler._interactorEvents = interactor
        
        interactor._delegate    = presenter
        interactor._dataManager = dataManager
        
        return viewController
    }
    
}

class VIPERViewController: UIViewController, VIPERViewInterface {
    
    // MARK: - Init & deinit
    
    deinit {
        print("VIPER: \(type(of:self)) deallocated")
    }
    
    // MARK: - VIPERViewInterface
    
    typealias PresenterInterfaceType    = AnyObject
    typealias EventHandlerInterfaceType = AnyObject
    
    var _presenter: PresenterInterfaceType!
    var _eventHandler: EventHandlerInterfaceType!
    
}

class VIPERTableViewController: UITableViewController, VIPERViewInterface {
    
    // MARK: - Init & deinit
    
    deinit {
        print("VIPER: \(type(of:self)) deallocated")
    }
    
    // MARK: - VIPERViewInterface
    
    typealias PresenterInterfaceType    = AnyObject
    typealias EventHandlerInterfaceType = AnyObject
    
    var _presenter: PresenterInterfaceType!
    var _eventHandler: EventHandlerInterfaceType!
    
}

class VIPERCollectionViewController: UICollectionViewController, VIPERViewInterface {
    
    // MARK: - Init & deinit
    
    deinit {
        print("VIPER: \(type(of:self)) deallocated")
    }
    
    // MARK: - VIPERViewInterface
    
    typealias PresenterInterfaceType    = AnyObject
    typealias EventHandlerInterfaceType = AnyObject
    
    var _presenter: PresenterInterfaceType!
    var _eventHandler: EventHandlerInterfaceType!
    
}

class VIPERPresenter: VIPERItem, VIPERPresenterInterface, VIPERInteractorDelegate {

    // MARK: - VIPERPresenterInterface
    
    typealias ViewInterfaceType                 = AnyObject
    typealias InteractorDataSourceInterfaceType = AnyObject
    typealias WireframeType                     = AnyObject
    
    weak var _viewInterface: ViewInterfaceType!
    weak var _interactorDataSource: InteractorDataSourceInterfaceType!
    var _wireframe: WireframeType!
    
    required override init() {
        super.init()
    }

    // MARK: - VIPERInteractorDelegate
    
}

class VIPEREventHandler: VIPERItem, VIPEREventHandlerInterface {

    // MARK: - VIPEREventHandlerInterface
    
    typealias PresenterInterfaceType        = AnyObject
    typealias InteractorEventsInterfaceType = AnyObject
    
    weak var _presenter: PresenterInterfaceType!
    var _interactorEvents: InteractorEventsInterfaceType!
    
    required override init() {
        super.init()
    }
    
}

class VIPERInteractor: VIPERItem, VIPERInteractorDataSourceInterface, VIPERInteractorEventsInterface {

    // MARK: - VIPERInteractorInterface
    
    required override init() {
        super.init()
    }
    
    // MARK: - VIPERInteractorEventsInterface
    
    typealias DelegateType = AnyObject
    
    weak var _delegate: DelegateType!
    
    // MARK: - VIPERInteractorDataSourceInterface
    
    typealias DataManagerType = AnyObject
    
    var _dataManager: DataManagerType!
    
}

class VIPERDataManager: VIPERItem {
    
    // MARK: - Init
    
    required override init() {
        super.init()
    }
    
}

