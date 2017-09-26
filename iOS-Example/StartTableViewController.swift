//
//  StartTableViewController.swift
//  iOS-Example
//
//  Created by Paweł Sporysz on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class StartTableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0:
                let simpleModule    = SimpleModuleBuilder.module()
                let simpleWireframe = simpleModule.wireframe
                navigationController?.pushViewController(simpleWireframe.viewController!, animated: true)
            default:
                break
        }
    }

}
