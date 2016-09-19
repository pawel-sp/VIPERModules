//
//  PersonEntity+CoreDataSortDescriptors.swift
//  ViperModuleGenerator
//
//  Created by Paweł Sporysz on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import Foundation
import CoreData

extension PersonEntity {

    class func fetchRequestSortedByLastName() -> NSFetchRequest<PersonEntity> {
        let fetchRequest:NSFetchRequest<PersonEntity> = self.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "lastName", ascending: true)]
        return fetchRequest
    }
    
}
