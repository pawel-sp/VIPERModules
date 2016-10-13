//
//  NSFRCEventInteractor.swift
//  ViperModuleGenerator
//
//  Created by Untitled Kingdom on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import CoreData
import VIPERModules

class NSFRCInteractor: VIPERInteractor {

    // MARK: - Properties
    
    fileprivate var fetchResultController:NSFetchedResultsController<PersonEntity>?

}

extension NSFRCInteractor: NSFRCInteractorEventsInterface {
    
    func fetchPersons() {
        fetchResultController = dataManager.newPersonFetchResultController()
        fetchResultController?.delegate = self
        do {
            try fetchResultController?.performFetch()
        } catch _ {}
    }
    
    func addRandomPerson() {
        self.dataManager.coreDataStack.persistentContainer.performBackgroundTask({ context in
            let personEntity = PersonEntity(context: context)
            personEntity.firstName = ["Pete", "John", "Vincent"].random
            personEntity.lastName  = ["Clooney", "Clinton", "Bravo"].random
            try! context.save()
        })
    }
    
}

extension NSFRCInteractor: NSFRCInteractorDataSourceInterface {
    
    func numberOfPersons() -> Int {
        return fetchResultController?.fetchedObjects?.count ?? 0
    }
    
    func personInfoAtIndex(_ index:Int) -> PersonInfo? {
        if let personEntity = fetchResultController?.fetchedObjects?[index] {
            return PersonInfo.personInfoFromPersonEntity(personEntity)
        } else {
            return nil
        }
    }
    
}
