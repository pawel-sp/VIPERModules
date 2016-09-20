//
//  NSFRCTableViewController.swift
//  ViperModuleGenerator
//
//  Created by Untitled Kingdom on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit
import VIPERModules

class NSFRCTableViewController: VIPERTableViewController, NSFRCViewInterface {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventHandler.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func didSelectAddBarButtonItem(_ sender: AnyObject) {
        eventHandler.didSelectAddButton()
    }
    
    // MARK: - Overrides
    
    override func animationForInsertedIndexPaths(_ indexPaths: [IndexPath]) -> UITableViewRowAnimation {
        return .right
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = presenter.titleForRowAtIndexPath(indexPath)
        return cell
    }
    
    // MARK: - NSFRCViewInterface
    
}
