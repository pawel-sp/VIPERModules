//
//  ExampleViewController.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 13.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class ExampleViewController: VIPERViewController, ExampleViewInterface {

    @IBAction func buttonAction(_ sender: AnyObject) {
        eventHandler.didSelectButton()
    }

}
