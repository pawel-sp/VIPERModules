//
//  ViewController.swift
//  ViperModuleGenerator
//
//  Created by Paweł Sporysz on 14.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func didSelectExampleButton(_ sender: AnyObject) {
        navigationController?.pushViewController(ExampleWireframe().customModule(), animated: true)
    }
}

