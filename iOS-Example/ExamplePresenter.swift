//
//  ExamplePresenter.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 13.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import Foundation
import VIPERModules

class ExamplePresenter: VIPERPresenter, ExamplePresenterInterface, ExampleInteractorDelegate {

    // MARK: - ExamplePresenterInterface
    
    func updateViewTitle() {
        viewInterface.displayNavigationBarTitle("Example Module")
    }
    
    func numberOfRows() -> Int {
        return interactorDataSource.dataCount()
    }
    
    func titleForRowAtIndexPath(_ indexPath:IndexPath) -> String {
        return interactorDataSource.titleForDataAtIndex(indexPath.row)
    }
    
    // MARK: - ExampleInteractorDelegate
    
    func loadedData() {
        viewInterface.reloadTableView()
    }
    
}
