//
//  SimpleViewController.swift
//  iOS-Example
//
//  Created by Paweł Sporysz on 13.06.2017.
//  Copyright © 2017 Paweł Sporysz. All rights reserved.
//

import VIPERModules

class SimpleViewController: VIPERVMSViewController<SimpleModuleBuilder>, SimpleViewInterface, UITableViewDataSource {
   
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventHandler.viewDidLoad()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = viewModels[indexPath.row].title
        return cell
    }
    
    // MARK: - SimpleViewInterface
    
    func displayNavigationBarTitle(_ title:String) {
        self.title = title
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
}

protocol SimpleViewModelInterface {
    
    var title: String { get }
    
}

struct SimpleViewModel: SimpleViewModelInterface {
    
    let title:String
    
}
