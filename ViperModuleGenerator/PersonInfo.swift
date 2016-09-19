//
//  PersonInfo.swift
//  ViperModuleGenerator
//
//  Created by Paweł Sporysz on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import Foundation

class PersonInfo {
    
    var firstName: String
    var lastName: String
    
    init(firstName:String, lastName: String) {
        self.firstName = firstName
        self.lastName  = lastName
    }
    
}

extension PersonInfo {
    
    class func personInfoFromPersonEntity(personEntity:PersonEntity) -> PersonInfo {
        return PersonInfo(firstName: personEntity.firstName ?? "", lastName: personEntity.lastName ?? "")
    }
    
}
