//
//  ExampleWireframe.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 13.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class ExampleWireframe: VIPERWireframe, ExampleWireframeInterface {

    var storyboard:UIStoryboard { return UIStoryboard.init(name: "Main", bundle: nil) }
    var viewControllerID:String { return "ExampleViewController" }
    
}
