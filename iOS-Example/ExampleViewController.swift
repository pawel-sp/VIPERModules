//
//  ExampleViewController.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 13.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit
import VIPERModules

class ExampleViewController: VIPERViewController, ExampleViewInterface, UITableViewDataSource {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventHandler.viewDidLoad()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = presenter.titleForRowAtIndexPath(indexPath)
        return cell
    }
    
    // MARK: - ExampleViewInterface
    
    func displayNavigationBarTitle(_ title:String) {
        self.title = title
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
}
