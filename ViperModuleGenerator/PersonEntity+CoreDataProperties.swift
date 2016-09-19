//
//  PersonEntity+CoreDataProperties.swift
//  ViperModuleGenerator
//
//  Created by Paweł Sporysz on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import Foundation
import CoreData


extension PersonEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonEntity> {
        return NSFetchRequest<PersonEntity>(entityName: "PersonEntity");
    }

    @NSManaged public var id: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

}
