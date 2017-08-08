//
//  VIPERModuleViewModelClasses.swift
//  VIPERModules
//
//  Created by Paweł Sporysz on 04.08.2017.
//  Copyright © 2017 Paweł Sporysz. All rights reserved.
//

import Foundation

// VM  - View Model
// VMS - View Models

open class VIPERVMViewController<ModuleBuilder: VIPERModuleBuilderInterface>: VIPERViewController<ModuleBuilder>, VIPERViewModelInterface {
    public var _viewModel: Any?
    public var viewModel: ModuleBuilder.ViewModel? {
        return _viewModel as? ModuleBuilder.ViewModel
    }
}

open class VIPERVMSViewController<ModuleBuilder: VIPERModuleBuilderInterface>: VIPERViewController<ModuleBuilder>, VIPERViewModelsInterface {
    public var _viewModels: [Any] = []
    public var viewModels: [ModuleBuilder.ViewModel] {
        return (_viewModels as? [ModuleBuilder.ViewModel]) ?? []
    }
}

open class VIPERVMTableViewController<ModuleBuilder: VIPERModuleBuilderInterface>: VIPERTableViewController<ModuleBuilder>, VIPERViewModelInterface {
    public var _viewModel: Any?
    public var viewModel: ModuleBuilder.ViewModel? {
        return _viewModel as? ModuleBuilder.ViewModel
    }
}

open class VIPERVMSTableViewController<ModuleBuilder: VIPERModuleBuilderInterface>: VIPERTableViewController<ModuleBuilder>, VIPERViewModelsInterface {
    public var _viewModels: [Any] = []
    public var viewModels: [ModuleBuilder.ViewModel] {
        return (_viewModels as? [ModuleBuilder.ViewModel]) ?? []
    }
}

open class VIPERVMCollectionViewController<ModuleBuilder: VIPERModuleBuilderInterface>: VIPERCollectionViewController<ModuleBuilder>, VIPERViewModelInterface {
    public var _viewModel: Any?
    public var viewModel: ModuleBuilder.ViewModel? {
        return _viewModel as? ModuleBuilder.ViewModel
    }
}

open class VIPERVMSCollectionViewController<ModuleBuilder: VIPERModuleBuilderInterface>: VIPERCollectionViewController<ModuleBuilder>, VIPERViewModelsInterface {
    public var _viewModels: [Any] = []
    public var viewModels: [ModuleBuilder.ViewModel] {
        return (_viewModels as? [ModuleBuilder.ViewModel]) ?? []
    }
}

open class VIPERVMPresenter<ModuleBuilder: VIPERModuleBuilderInterface>: VIPERPresenter<ModuleBuilder> {
    public var viewInterfaceVM: ModuleBuilder.ViewModel? {
        set {
            (viewInterface as? VIPERViewModelInterface)?._viewModel = newValue
        }
        get {
            return (viewInterface as? VIPERViewModelInterface)?._viewModel as? ModuleBuilder.ViewModel
        }
    }
}

open class VIPERVMSPresenter<ModuleBuilder: VIPERModuleBuilderInterface>: VIPERPresenter<ModuleBuilder> {
    public var viewInterfaceVMS: [ModuleBuilder.ViewModel] {
        set {
            (viewInterface as? VIPERViewModelsInterface)?._viewModels = newValue
        }
        get {
            return ((viewInterface as? VIPERViewModelsInterface)?._viewModels as? [ModuleBuilder.ViewModel]) ?? []
        }
    }
}
