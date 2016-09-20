//
//  NSFRCWireframe.swift
//  ViperModuleGenerator
//
//  Created by Untitled Kingdom on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit
import VIPERModules

class NSFRCWireframe: VIPERWireframe, NSFRCWireframeInterface {
    
    // MARK: - NSFRCWireframeInterface
    
    var storyboard:UIStoryboard { return UIStoryboard.init(name: "Main", bundle: nil) }
    var viewControllerID:String { return "NSFRCTableViewController" }
    
}
