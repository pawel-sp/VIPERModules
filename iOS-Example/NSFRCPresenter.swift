//
//  NSFRCPresenter.swift
//  ViperModuleGenerator
//
//  Created by Untitled Kingdom on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import Foundation

class NSFRCPresenter: VIPERFetchResultControllerPresenter, NSFRCPresenterInterface, NSFRCInteractorDelegate {
    
    // MARK: - NSFRCPresenterInterface

    func numberOfRows() -> Int {
        return interactorDataSource.numberOfPersons()
    }
    
    func titleForRowAtIndexPath(indexPath:IndexPath) -> String {
        if let person = interactorDataSource.personInfoAtIndex(index: indexPath.row) {
            return "\(person.firstName) \(person.lastName)"
        } else {
            return ""
        }
    }
    
    // MARK: - NSFRCInteractorDelegate
    
}
