//
//  VIPERModuleClasses.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 08.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

open class VIPERItem: NSObject {
    
    deinit {
        print("VIPER: \(type(of:self)) deallocated")
    }
    
}


open class VIPERWireframe: VIPERItem, VIPERWireframeInterface {
    
    // MARK: - VIPERWireframeInterface
    
    public weak var viewController:UIViewController?
    
    public func module<
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
        
        self.viewController = viewController as? UIViewController
        
        return viewController
    }
    
}

open class VIPERViewController: UIViewController, VIPERViewInterface {
    
    // MARK: - Init & deinit
    
    deinit {
        print("VIPER: \(type(of:self)) deallocated")
    }
    
    // MARK: - VIPERViewInterface
    
    public typealias PresenterInterfaceType    = AnyObject
    public typealias EventHandlerInterfaceType = AnyObject
    
    public var _presenter: PresenterInterfaceType!
    public var _eventHandler: EventHandlerInterfaceType!
    
}

open class VIPERTableViewController: UITableViewController, VIPERViewInterface {
    
    // MARK: - Init & deinit
    
    deinit {
        print("VIPER: \(type(of:self)) deallocated")
    }
    
    // MARK: - VIPERViewInterface
    
    public typealias PresenterInterfaceType    = AnyObject
    public typealias EventHandlerInterfaceType = AnyObject
    
    public var _presenter: PresenterInterfaceType!
    public var _eventHandler: EventHandlerInterfaceType!
    
}

open class VIPERCollectionViewController: UICollectionViewController, VIPERViewInterface {
    
    // MARK: - Init & deinit
    
    deinit {
        print("VIPER: \(type(of:self)) deallocated")
    }
    
    // MARK: - VIPERViewInterface
    
    public typealias PresenterInterfaceType    = AnyObject
    public typealias EventHandlerInterfaceType = AnyObject
    
    public var _presenter: PresenterInterfaceType!
    public var _eventHandler: EventHandlerInterfaceType!
    
}

open class VIPERPresenter: VIPERItem, VIPERPresenterInterface, VIPERInteractorDelegate {
 
    // MARK: - VIPERPresenterInterface
    
    public typealias ViewInterfaceType                 = AnyObject
    public typealias InteractorDataSourceInterfaceType = AnyObject
    public typealias WireframeType                    = AnyObject
    
    public weak var _viewInterface: ViewInterfaceType!
    public weak var _interactorDataSource: InteractorDataSourceInterfaceType!
    public var _wireframe: WireframeType!
    
    required override public init() {
        super.init()
    }

    // MARK: - VIPERInteractorDelegate
    
}

open class VIPEREventHandler: VIPERItem, VIPEREventHandlerInterface {

    // MARK: - VIPEREventHandlerInterface
    
    public typealias PresenterInterfaceType        = AnyObject
    public typealias InteractorEventsInterfaceType = AnyObject
    
    public weak var _presenter: PresenterInterfaceType!
    public var _interactorEvents: InteractorEventsInterfaceType!
    
    required override public init() {
        super.init()
    }
    
}

open class VIPERInteractor: VIPERItem, VIPERInteractorDataSourceInterface, VIPERInteractorEventsInterface {

    // MARK: - VIPERInteractorInterface
    
    required override public init() {
        super.init()
    }
    
    // MARK: - VIPERInteractorEventsInterface
    
    public typealias DelegateType = AnyObject
    
    public weak var _delegate: DelegateType!
    
    // MARK: - VIPERInteractorDataSourceInterface
    
    public typealias DataManagerType = AnyObject
    
    public var _dataManager: DataManagerType!
    
}

open class VIPERDataManager: VIPERItem {
    
    // MARK: - Init
    
    required override public init() {
        super.init()
    }
    
}

