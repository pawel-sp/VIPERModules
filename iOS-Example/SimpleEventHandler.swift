//
//  SimpleEventHandler.swift
//  iOS-Example
//
//  Created by Paweł Sporysz on 13.06.2017.
//  Copyright © 2017 Paweł Sporysz. All rights reserved.
//

import VIPERModules

class SimpleEventHandler: VIPEREventHandler<SimpleModuleBuilder>, SimpleEventHandlerInterface {
    
    // MARK: - SimpleEventHandlerInterface
    
    func viewDidLoad() {
        presenter.updateViewTitle()
        interactorEvents.loadData()
    }

    
}
