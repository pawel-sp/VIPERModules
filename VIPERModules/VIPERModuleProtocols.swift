//
//  VIPERModuleProtocols.swift
//  VIPERModules
//
//  Created by Paweł Sporysz on 08.09.2016.
//  Copyright (c) 2017 Paweł Sporysz
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

public protocol VIPERModuleBuilderInterface {
    typealias Module = (wireframe: WireframeInterface, presenter: PresenterInterface)
    
    associatedtype WireframeInterface
    associatedtype ViewInterace
    associatedtype PresenterInterface
    associatedtype EventHandlerInterface
    associatedtype InteractorDataSourceInterface
    associatedtype InteractorEventsInterface
    associatedtype InteractorEventsDelegate
    associatedtype DataManagerInterface
}

public protocol VIPERWireframeInterface: class {
    var _viewController: UIViewController? { get set }
    var viewController: UIViewController? { get }
    var storyboard: UIStoryboard! { get }
    var viewControllerID: String! { get }
    init()
}

public protocol VIPERViewInterface: class {
    var _presenter: VIPERPresenterInterface! { get set }
    var _eventHandler: VIPEREventHandlerInterface! { get set }
}

public protocol VIPERPresenterInterface: class {
    var _viewInterface: VIPERViewInterface! { get set }
    var _wireframe: VIPERWireframeInterface! { get set }
    var _interactorDataSource: VIPERInteractorDataSourceInterface! { get set }
    init()
}

public protocol VIPEREventHandlerInterface: class {
    var _presenter: VIPERPresenterInterface! { get set }
    var _interactorEvents: VIPERInteractorEventsInterface! { get set }
    init()
}

public protocol VIPERInteractorDataSourceInterface: class {
    var _dataManager: VIPERDataManagerInterface! { get set }
    init()
}

public protocol VIPERInteractorEventsInterface: class {
    var _delegate: VIPERInteractorEventsDelegate? { get set }
    init()
}

public protocol VIPERInteractorEventsDelegate: class {}

public protocol VIPERDataManagerInterface: class {
    init()
}
