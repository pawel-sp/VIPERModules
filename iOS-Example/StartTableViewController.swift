//
//  StartTableViewController.swift
//  ViperModuleGenerator
//
//  Created by Paweł Sporysz on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class StartTableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0:
                navigationController?.pushViewController(ExampleWireframe().customModule(dataLimit: 5), animated: true)
            case 1:
                navigationController?.pushViewController(NSFRCWireframe().customModule(), animated: true)
            default:
                break
        }
    }

}
