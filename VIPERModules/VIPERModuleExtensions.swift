//
//  VIPERModuleExtensions.swift
//  VIPERModules
//
//  Created by Paweł Sporysz on 13.06.2017.
//  Copyright © 2017 Paweł Sporysz. All rights reserved.
//  https://github.com/pawel-sp/VIPERModules
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

public extension VIPERModuleBuilderInterface {
    
    public static func module
        (
        wireframe: WireframeInterface,
        viewInterface: ViewInterace,
        presenter: PresenterInterface,
        eventHandler: EventHandlerInterface,
        interactorDataSource: InteractorDataSourceInterface,
        interactorEvents: InteractorEventsInterface,
        interactorEventsDelegate: InteractorEventsDelegate,
        dataManager: DataManagerInterface
        ) -> Module
    {
        guard var viperWireframe = wireframe as? VIPERWireframeInterface else {
            VIPERLogger.fatal("WireframeInterface needs to conform to protocol VIPERWireframeInterface")
        }
        guard let viperViewInteface = viewInterface as? VIPERViewInterface else {
            VIPERLogger.fatal("ViewInterface needs to conform to protocol VIPERViewInterface")
        }
        guard var viperPresenter = presenter as? VIPERPresenterInterface else {
            VIPERLogger.fatal("PresenterInterface needs to conform to protocol VIPERPresenterInterface")
        }
        guard var viperEventHandler = eventHandler as? VIPEREventHandlerInterface else {
            VIPERLogger.fatal("EventHandlerInterface needs to conform to protocol VIPEREventHandlerInterface")
        }
        guard var viperInteractorEvents = interactorEvents as? VIPERInteractorEventsInterface else {
            VIPERLogger.fatal("InteractorEventsInterface needs to conform to protocol VIPERInteractorEventsInterface")
        }
        guard let viperInteractorDelegate = interactorEventsDelegate as? VIPERInteractorEventsDelegate else {
            VIPERLogger.fatal("InteractorEventsDelegate needs to conform to protocol VIPERInteractorEventsDelegate")
        }
        guard var viperInteractorDataSource = interactorDataSource as? VIPERInteractorDataSourceInterface else {
            VIPERLogger.fatal("InteractorDataSourceInterface needs to conform to protocol VIPERInteractorDataSourceInterface")
        }
        guard let viperDataManager = dataManager as? VIPERDataManagerInterface else {
            VIPERLogger.fatal("DataManagerInterface needs to conform to protocol VIPERDataManagerInterface")
        }
        
        viperWireframe._viewController = viperViewInteface as? UIViewController
        
        viperViewInteface._presenter    = viperPresenter
        viperViewInteface._eventHandler = viperEventHandler
        
        viperPresenter._viewInterface        = viperViewInteface
        viperPresenter._wireframe            = viperWireframe
        viperPresenter._interactorDataSource = viperInteractorDataSource
        
        viperEventHandler._presenter        = viperPresenter
        viperEventHandler._interactorEvents = viperInteractorEvents
        
        viperInteractorDataSource._dataManager = viperDataManager
        
        viperInteractorEvents._delegate = viperInteractorDelegate
        
        return (wireframe, presenter)
    }
    
    public static func module
        <
        W: VIPERWireframeInterface,
        V: VIPERViewInterface,
        P: VIPERPresenterInterface & VIPERInteractorEventsDelegate,
        E: VIPEREventHandlerInterface,
        I: VIPERInteractorEventsInterface & VIPERInteractorDataSourceInterface,
        D: VIPERDataManagerInterface
        >
        (
        wireframeType: W.Type,
        viewInterfaceType: V.Type,
        presenterType: P.Type,
        eventHandlerType: E.Type,
        interactorType: I.Type,
        dataManagerType: D.Type,
        wireframeInitBlock: ((W.Type) -> W)? = nil,
        viewInterfaceInitBlock: ((V.Type) -> V)? = nil,
        presenterInitBlock: ((P.Type) -> P)? = nil,
        eventHandlerInitBlock: ((E.Type) -> E)? = nil,
        interactorInitBlock: ((I.Type) -> I)? = nil,
        dataManagerInitBlock: ((D.Type) -> D)? = nil
        ) -> Module
    {
        let wireframe     = wireframeInitBlock?(wireframeType) ?? wireframeType.init()
        let viewInterface = viewInterfaceInitBlock?(viewInterfaceType) ?? wireframe.storyboard.instantiateViewController(withIdentifier: wireframe.viewControllerID) as! V
        let presenter     = presenterInitBlock?(presenterType) ?? presenterType.init()
        let eventHandler  = eventHandlerInitBlock?(eventHandlerType) ?? eventHandlerType.init()
        let interactor    = interactorInitBlock?(interactorType) ?? interactorType.init()
        let dataManager   = dataManagerInitBlock?(dataManagerType) ?? dataManagerType.init()
        
        return module(
            wireframe: wireframe as! WireframeInterface,
            viewInterface: viewInterface as! ViewInterace,
            presenter: presenter as! PresenterInterface,
            eventHandler: eventHandler as! EventHandlerInterface,
            interactorDataSource: interactor as! InteractorDataSourceInterface,
            interactorEvents: interactor as! InteractorEventsInterface,
            interactorEventsDelegate: presenter as! InteractorEventsDelegate,
            dataManager: dataManager as! DataManagerInterface
        )
    }
    
}
