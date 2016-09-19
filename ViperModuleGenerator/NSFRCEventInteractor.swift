//
//  NSFRCEventInteractor.swift
//  ViperModuleGenerator
//
//  Created by Untitled Kingdom on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import CoreData

class NSFRCInteractor: VIPERInteractor, NSFRCInteractorEventsInterface, NSFRCInteractorDataSourceInterface {

    // MARK: - Properties
    
    private var fetchResultController:NSFetchedResultsController<PersonEntity>?
    
    // MARK: - NSFRCInteractorEventsInterface
    
    func fetchPersons() {
        fetchResultController = NSFetchedResultsController(
            fetchRequest: PersonEntity.fetchRequestSortedByLastName(),
            managedObjectContext: self.dataManager.coreDataStack.persistentContainer.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        fetchResultController?.delegate = self
        do {
            try fetchResultController?.performFetch()
        } catch _ {}
    }
    
    func addRandomPerson() {
        let context      = self.dataManager.coreDataStack.persistentContainer.viewContext
        let personEntity = PersonEntity(context: context)
        personEntity.firstName = ["Pete", "John", "Vincent"].random
        personEntity.lastName  = ["Clooney", "Clinton", "Bravo"].random
        do {
            try context.save()
        } catch _ {}
    }
    
    // MARK: - NSFRCInteractorDataSourceInterface
    
    func numberOfPersons() -> Int {
        return fetchResultController?.fetchedObjects?.count ?? 0
    }
    
    func personInfoAtIndex(index:Int) -> PersonInfo? {
        if let personEntity = fetchResultController?.fetchedObjects?[index] {
            return PersonInfo.personInfoFromPersonEntity(personEntity: personEntity)
        } else {
            return nil
        }
    }

}
