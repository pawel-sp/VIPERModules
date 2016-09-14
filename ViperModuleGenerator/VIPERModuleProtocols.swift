//
//  VIPERModuleProtocols.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 08.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

// MARK: - Base protocols

protocol VIPERWireframeInterface: NSObjectProtocol {
  
    func module<VIPERViewControllerType:VIPERViewController, VIPERPresenterType:VIPERPresenter, VIPEREventHandlerType:VIPEREventHandler, VIPERInteractorType:VIPERInteractor, VIPERDataManagerType:VIPERDataManager>(storyboard:UIStoryboard, viewControllerID:String, presenterType:VIPERPresenterType.Type, eventHandlerType:VIPEREventHandlerType.Type, interactorType:VIPERInteractorType.Type, dataManagerType:VIPERDataManagerType.Type) -> VIPERViewControllerType
    
}

protocol VIPERViewInterface: NSObjectProtocol {

    associatedtype PresenterInterfaceType
    associatedtype EventHandlerInterfaceType
    
    var _presenter:PresenterInterfaceType! { get set }
    var _eventHandler:EventHandlerInterfaceType! { get set }

}

protocol VIPERPresenterInterface: NSObjectProtocol {

    associatedtype ViewInterfaceType
    associatedtype InteractorDataSourceInterfaceType
    associatedtype WireframeType
    
    var _viewInterface: ViewInterfaceType! { get set }
    var _interactorDataSource: InteractorDataSourceInterfaceType! { get set }
    var _wireframe: WireframeType! { get set }
    
    init()

}

protocol VIPEREventHandlerInterface: NSObjectProtocol {

    associatedtype PresenterInterfaceType
    associatedtype InteractorEventsInterfaceType
    
    var _presenter: PresenterInterfaceType! { get set }
    var _interactorEvents: InteractorEventsInterfaceType! { get set }
 
    init()
    
}

protocol VIPERInteractorInterface: NSObjectProtocol {
    
    init()
    
}

protocol VIPERInteractorEventsInterface: VIPERInteractorInterface {

    associatedtype DelegateType
    
    var _delegate: DelegateType! { get set }

}

protocol VIPERInteractorDataSourceInterface: VIPERInteractorInterface {

    associatedtype DataManagerType
    
    var _dataManager: DataManagerType! { get set }

}

protocol VIPERInteractorDelegate: NSObjectProtocol {}

// MARK: - Custom protocols

protocol VIPERCustomWireframeInterface: VIPERWireframeInterface {
    
    associatedtype CustomViewInterfaceType: VIPERViewController
    associatedtype CustomPresenterInterfaceType: VIPERPresenter
    associatedtype CustomEventHandlerInterfaceType: VIPEREventHandler
    associatedtype CustomInteractorInterfaceType: VIPERInteractor
    associatedtype CustomDataManagerType: VIPERDataManager
    
    var storyboard:UIStoryboard { get }
    var viewControllerID:String { get }
    
    func customModule() -> CustomViewInterfaceType
    
}

protocol VIPERCustomViewInterface: VIPERViewInterface {
    
    associatedtype CustomPresenterType: VIPERPresenter
    associatedtype CustomEventHandlerType: VIPEREventHandler
    
    var presenter: CustomPresenterType { get }
    var eventHandler: CustomEventHandlerType { get }
    
}

protocol VIPERCustomPresenterInterface: VIPERPresenterInterface {
    
    associatedtype CustomViewControllerType: VIPERViewController
    associatedtype CustomInteractorDataSourceType: VIPERInteractor
    associatedtype CustomWireframeType: VIPERWireframe
    
    var viewInterface: CustomViewControllerType { get }
    var interactorDataSource: CustomInteractorDataSourceType { get }
    var wireframe:CustomWireframeType { get }
    
}

protocol VIPERCustomEventHandlerInterface: VIPEREventHandlerInterface {
    
    associatedtype CustomPresenterType: VIPERPresenter
    associatedtype CustomInteractorEventsType: VIPERInteractor
    
    var presenter: CustomPresenterType { get }
    var interactorEvents: CustomInteractorEventsType { get }
    
}

protocol VIPERCustomInteractorEventsInterface: VIPERInteractorEventsInterface {
    
    associatedtype CustomDelegateType: VIPERPresenter
    
    var delegate: CustomDelegateType { get }
    
}

protocol VIPERCustomInteractorDataSourceInterface: VIPERInteractorDataSourceInterface {
    
    associatedtype CustomDataManagerType: VIPERDataManager
    
    var dataManager: CustomDataManagerType { get }
    
}

protocol VIPERCustomInteractorDelegate: VIPERInteractorDelegate {
    
    
}

// MARK: - Extensions

extension VIPERCustomWireframeInterface {
    
    func customModule() -> CustomViewInterfaceType {
        return module(
            storyboard: storyboard,
            viewControllerID: viewControllerID,
            presenterType: CustomPresenterInterfaceType.self,
            eventHandlerType: CustomEventHandlerInterfaceType.self,
            interactorType: CustomInteractorInterfaceType.self,
            dataManagerType: CustomDataManagerType.self
        )
    }
    
}

extension VIPERCustomViewInterface {
    
    var presenter:CustomPresenterType { return _presenter as! CustomPresenterType }
    var eventHandler:CustomEventHandlerType { return _eventHandler as! CustomEventHandlerType }
    
}

extension VIPERCustomPresenterInterface {
    
    var viewInterface: CustomViewControllerType { return _viewInterface as! CustomViewControllerType }
    var interactorDataSource: CustomInteractorDataSourceType { return _interactorDataSource as! CustomInteractorDataSourceType }
    var wireframe:CustomWireframeType { return _wireframe as! CustomWireframeType }
    
}

extension VIPERCustomEventHandlerInterface {
    
    var presenter: CustomPresenterType { return _presenter as! CustomPresenterType }
    var interactorEvents: CustomInteractorEventsType { return _interactorEvents as! CustomInteractorEventsType }
    
}

extension VIPERCustomInteractorEventsInterface {
    
    var delegate: CustomDelegateType { return _delegate as! CustomDelegateType }
    
}

extension VIPERCustomInteractorDataSourceInterface {
    
    var dataManager: CustomDataManagerType { return _dataManager as! CustomDataManagerType }
    
}
