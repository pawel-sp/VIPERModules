//
//  VIPERModuleClasses.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 08.09.2016.
//  Copyright (c) 2017 Paweł Sporysz
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

open class VIPERModuleItem {
    
    public required init() {}
    
    deinit {
        VIPERLogger.log("\(type(of:self)) deallocated")
    }
    
}

open class VIPERWireframe<ModuleBuilder: VIPERModuleBuilderInterface>: VIPERModuleItem, VIPERWireframeInterface {
    
    public weak var _viewInterface: VIPERViewInterface!
    public var viewInterface: ModuleBuilder.ViewInterace {
        return _viewInterface as! ModuleBuilder.ViewInterace
    }
    
    public var viewController: UIViewController? {
        return viewInterface as? UIViewController
    }
    
    open var storyboard:UIStoryboard! {
        VIPERLogger.fatal("You need to override storyboard property in your subclass")
    }
    
    open var viewControllerID:String! {
        VIPERLogger.fatal("You need to override viewControllerID property in your subclass")
    }
    
}

open class VIPERViewController<ModuleBuilder: VIPERModuleBuilderInterface>: UIViewController, VIPERViewInterface {
    
    public var _presenter: VIPERPresenterInterface!
    public var presenter: ModuleBuilder.PresenterInterface {
        return _presenter as! ModuleBuilder.PresenterInterface
    }
    
    public var _eventHandler: VIPEREventHandlerInterface!
    public var eventHandler: ModuleBuilder.EventHandlerInterface {
        return _eventHandler as! ModuleBuilder.EventHandlerInterface
    }
    
    deinit {
        VIPERLogger.log("\(type(of:self)) deallocated")
    }
    
}

open class VIPERTableViewController<ModuleBuilder: VIPERModuleBuilderInterface>: UITableViewController, VIPERViewInterface {
    
    public var _presenter: VIPERPresenterInterface!
    public var presenter: ModuleBuilder.PresenterInterface {
        return _presenter as! ModuleBuilder.PresenterInterface
    }
    
    public var _eventHandler: VIPEREventHandlerInterface!
    public var eventHandler: ModuleBuilder.EventHandlerInterface {
        return _eventHandler as! ModuleBuilder.EventHandlerInterface
    }
    
    deinit {
        VIPERLogger.log("\(type(of:self)) deallocated")
    }
    
}

open class VIPERCollectionViewController<ModuleBuilder: VIPERModuleBuilderInterface>: UICollectionViewController, VIPERViewInterface {
    
    public var _presenter: VIPERPresenterInterface!
    public var presenter: ModuleBuilder.PresenterInterface {
        return _presenter as! ModuleBuilder.PresenterInterface
    }
    
    public var _eventHandler: VIPEREventHandlerInterface!
    public var eventHandler: ModuleBuilder.EventHandlerInterface {
        return _eventHandler as! ModuleBuilder.EventHandlerInterface
    }
    
    deinit {
        VIPERLogger.log("\(type(of:self)) deallocated")
    }
    
}

open class VIPERPresenter<ModuleBuilder: VIPERModuleBuilderInterface>: VIPERModuleItem, VIPERPresenterInterface {
    
    public weak var _viewInterface: VIPERViewInterface!
    public var viewInterface: ModuleBuilder.ViewInterace {
        return _viewInterface as! ModuleBuilder.ViewInterace
    }
    
    public var _wireframe: VIPERWireframeInterface!
    public var wireframe: ModuleBuilder.WireframeInterface {
        return _wireframe as! ModuleBuilder.WireframeInterface
    }
    
    public var _interactorDataSource: VIPERInteractorDataSourceInterface!
    public var interactorDataSource: ModuleBuilder.InteractorDataSourceInterface {
        return _interactorDataSource as! ModuleBuilder.InteractorDataSourceInterface
    }
    
}

open class VIPEREventHandler<ModuleBuilder: VIPERModuleBuilderInterface>: VIPERModuleItem, VIPEREventHandlerInterface {
    
    public var _presenter: VIPERPresenterInterface!
    public var presenter: ModuleBuilder.PresenterInterface {
        return _presenter as! ModuleBuilder.PresenterInterface
    }
    
    public var _interactorEvents: VIPERInteractorEventsInterface!
    public var interactorEvents: ModuleBuilder.InteractorEventsInterface {
        return _interactorEvents as! ModuleBuilder.InteractorEventsInterface
    }
    

    
}

open class VIPERInteractor<ModuleBuilder: VIPERModuleBuilderInterface>: VIPERModuleItem, VIPERInteractorDataSourceInterface, VIPERInteractorEventsInterface {
    
    public var _dataManager: VIPERDataManagerInterface!
    public var dataManager: ModuleBuilder.DataManagerInterface {
        return _dataManager as! ModuleBuilder.DataManagerInterface
    }
    
    public weak var _delegate: VIPERInteractorEventsDelegate?
    public var delegate: ModuleBuilder.InteractorEventsDelegate? {
        return _delegate as? ModuleBuilder.InteractorEventsDelegate
    }
    
}

open class VIPERDataManager: VIPERModuleItem, VIPERDataManagerInterface {
    
}
