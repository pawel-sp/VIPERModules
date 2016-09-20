//
//  ExampleEventHandler.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 13.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import Foundation
import VIPERModules

class ExampleEventHandler: VIPEREventHandler, ExampleEventHandlerInterface {
    
    // MARK: - ExampleEventHandlerInterface
    
    func viewDidLoad() {
        presenter.updateViewTitle()
        interactorEvents.loadData()
    }
    
}
