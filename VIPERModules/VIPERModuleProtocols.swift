//
//  VIPERModuleProtocols.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 08.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

// MARK: - Base protocols

public protocol VIPERWireframeInterface: NSObjectProtocol {
    
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
        ) -> VIPERViewControllerType
    
}

public protocol VIPERViewInterface: NSObjectProtocol {

    associatedtype PresenterInterfaceType
    associatedtype EventHandlerInterfaceType
    
    var _presenter:PresenterInterfaceType! { get set }
    var _eventHandler:EventHandlerInterfaceType! { get set }

}

public protocol VIPERPresenterInterface: NSObjectProtocol {

    associatedtype ViewInterfaceType
    associatedtype InteractorDataSourceInterfaceType
    
    var _viewInterface: ViewInterfaceType! { get set }
    var _interactorDataSource: InteractorDataSourceInterfaceType! { get set }
    
    init()

}

public protocol VIPEREventHandlerInterface: NSObjectProtocol {

    associatedtype PresenterInterfaceType
    associatedtype InteractorEventsInterfaceType
    associatedtype WireframeType
    
    var _presenter: PresenterInterfaceType! { get set }
    var _interactorEvents: InteractorEventsInterfaceType! { get set }
    var _wireframe: WireframeType! { get set }
 
    init()
    
}

public protocol VIPERInteractorInterface: NSObjectProtocol {
    
    init()
    
}

public protocol VIPERInteractorEventsInterface: VIPERInteractorInterface {

    associatedtype DelegateType
    
    var _delegate: DelegateType! { get set }

}

public protocol VIPERInteractorDataSourceInterface: VIPERInteractorInterface {

    associatedtype DataManagerType
    
    var _dataManager: DataManagerType! { get set }

}

public protocol VIPERInteractorDelegate: NSObjectProtocol {}

// MARK: - Custom protocols

public protocol VIPERCustomWireframeInterface: VIPERWireframeInterface {
    
    associatedtype CustomViewInterfaceType: VIPERViewInterface
    associatedtype CustomPresenterInterfaceType: VIPERPresenter
    associatedtype CustomEventHandlerInterfaceType: VIPEREventHandler
    associatedtype CustomInteractorInterfaceType: VIPERInteractor
    associatedtype CustomDataManagerType: VIPERDataManager
    
    var storyboard:UIStoryboard { get }
    var viewControllerID:String { get }
    
    func customModule() -> CustomViewInterfaceType
    func customModule(
        presenterInitBlock: ((CustomPresenterInterfaceType.Type) -> (CustomPresenterInterfaceType))?,
        eventHandlerInitBlock: ((CustomEventHandlerInterfaceType.Type) -> (CustomEventHandlerInterfaceType))?,
        interactorInitBlock: ((CustomInteractorInterfaceType.Type) -> (CustomInteractorInterfaceType))?,
        dataManagerInitBlock: ((CustomDataManagerType.Type) -> (CustomDataManagerType))?)
        -> CustomViewInterfaceType
    
}

public protocol VIPERCustomViewInterface: VIPERViewInterface {
    
    associatedtype CustomPresenterType: VIPERPresenter
    associatedtype CustomEventHandlerType: VIPEREventHandler
    
    var presenter: CustomPresenterType { get }
    var eventHandler: CustomEventHandlerType { get }
    
}

public protocol VIPERCustomPresenterInterface: VIPERPresenterInterface {
    
    associatedtype CustomViewControllerType: VIPERViewInterface
    associatedtype CustomInteractorDataSourceType: VIPERInteractor
    
    var viewInterface: CustomViewControllerType { get }
    var interactorDataSource: CustomInteractorDataSourceType { get }
    
}

public protocol VIPERCustomEventHandlerInterface: VIPEREventHandlerInterface {
    
    associatedtype CustomPresenterType: VIPERPresenter
    associatedtype CustomInteractorEventsType: VIPERInteractor
    associatedtype CustomWireframeType: VIPERWireframe
    
    var presenter: CustomPresenterType { get }
    var interactorEvents: CustomInteractorEventsType { get }
    var wireframe:CustomWireframeType { get }
    
}

public protocol VIPERCustomInteractorEventsInterface: VIPERInteractorEventsInterface {
    
    associatedtype CustomDelegateType: VIPERPresenter
    
    var delegate: CustomDelegateType { get }
    
}

public protocol VIPERCustomInteractorDataSourceInterface: VIPERInteractorDataSourceInterface {
    
    associatedtype CustomDataManagerType: VIPERDataManager
    
    var dataManager: CustomDataManagerType { get }
    
}

public protocol VIPERCustomInteractorDelegate: VIPERInteractorDelegate {

}

// MARK: - Extensions

public extension VIPERCustomWireframeInterface {
    
    func customModule(
        presenterInitBlock: ((CustomPresenterInterfaceType.Type) -> (CustomPresenterInterfaceType))?,
        eventHandlerInitBlock: ((CustomEventHandlerInterfaceType.Type) -> (CustomEventHandlerInterfaceType))?,
        interactorInitBlock: ((CustomInteractorInterfaceType.Type) -> (CustomInteractorInterfaceType))?,
        dataManagerInitBlock: ((CustomDataManagerType.Type) -> (CustomDataManagerType))?) -> CustomViewInterfaceType {
        
        return module(
            storyboard: storyboard,
            viewControllerID: viewControllerID,
            presenterType: CustomPresenterInterfaceType.self,
            eventHandlerType: CustomEventHandlerInterfaceType.self,
            interactorType: CustomInteractorInterfaceType.self,
            dataManagerType: CustomDataManagerType.self,
            presenterInitBlock: presenterInitBlock,
            eventHandlerInitBlock: eventHandlerInitBlock,
            interactorInitBlock: interactorInitBlock,
            dataManagerInitBlock: dataManagerInitBlock
        ) 
        
    }
    
    func customModule() -> CustomViewInterfaceType {
        return customModule(
            presenterInitBlock: nil,
            eventHandlerInitBlock: nil,
            interactorInitBlock: nil,
            dataManagerInitBlock: nil
        )
    }
    
}

public extension VIPERCustomViewInterface {
    
    var presenter:CustomPresenterType { return _presenter as! CustomPresenterType }
    var eventHandler:CustomEventHandlerType { return _eventHandler as! CustomEventHandlerType }
    
}

public extension VIPERCustomPresenterInterface {
    
    var viewInterface: CustomViewControllerType { return _viewInterface as! CustomViewControllerType }
    var interactorDataSource: CustomInteractorDataSourceType { return _interactorDataSource as! CustomInteractorDataSourceType }
    
}

public extension VIPERCustomEventHandlerInterface {
    
    var presenter: CustomPresenterType { return _presenter as! CustomPresenterType }
    var interactorEvents: CustomInteractorEventsType { return _interactorEvents as! CustomInteractorEventsType }
    var wireframe:CustomWireframeType { return _wireframe as! CustomWireframeType }
    
}

public extension VIPERCustomInteractorEventsInterface {
    
    var delegate: CustomDelegateType { return _delegate as! CustomDelegateType }
    
}

public extension VIPERCustomInteractorDataSourceInterface {
    
    var dataManager: CustomDataManagerType { return _dataManager as! CustomDataManagerType }
    
}
