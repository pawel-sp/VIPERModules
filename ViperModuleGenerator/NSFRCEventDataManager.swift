//
//  NSFRCEventDataManager.swift
//  ViperModuleGenerator
//
//  Created by Untitled Kingdom on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

class NSFRCDataManager: VIPERDataManager {
    
    // MARK: - Properties
    
    let coreDataStack: CoreDataStack
    
    // MARK: - Init
    
    required init() {
        coreDataStack = CoreDataStack.sharedStack
        super.init()
    }
    
}
