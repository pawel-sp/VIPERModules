//
//  NSFRCEventHandler.swift
//  ViperModuleGenerator
//
//  Created by Untitled Kingdom on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import VIPERModules

class NSFRCEventHandler: VIPEREventHandler, NSFRCEventHandlerInterface {
    
    // MARK: - NSFRCEventHandlerInterface
    
    func viewDidLoad() {
        interactorEvents.fetchPersons()
    }
    
    func didSelectAddButton() {
        interactorEvents.addRandomPerson()
    }
}
