//
//  VIPERModuleViewModelProtocols.swift
//  VIPERModules
//
//  Created by Paweł Sporysz on 04.08.2017.
//  Copyright © 2017 Paweł Sporysz. All rights reserved.
//

import Foundation

public protocol VIPERViewModelInterface: VIPERViewInterface {
    var _viewModel: Any? { get set }
}

public protocol VIPERViewModelsInterface: VIPERViewInterface {
    var _viewModels: [Any] { get set }
}
