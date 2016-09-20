//
//  NSFRCEventDataManager.swift
//  ViperModuleGenerator
//
//  Created by Untitled Kingdom on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import CoreData

class NSFRCDataManager: VIPERDataManager {
    
    // MARK: - Properties
    
    let coreDataStack: CoreDataStack
    
    // MARK: - Init
    
    required init() {
        coreDataStack = CoreDataStack.sharedStack
        super.init()
    }
    
    // MARK: - Utilities
    
    func newPersonFetchResultController() -> NSFetchedResultsController<PersonEntity> {
        return NSFetchedResultsController(
            fetchRequest: PersonEntity.fetchRequestSortedByLastName(),
            managedObjectContext: self.coreDataStack.persistentContainer.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
    }
    
}
