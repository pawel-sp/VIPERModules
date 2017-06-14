//
//  SimpleWireframe.swift
//  iOS-Example
//
//  Created by Paweł Sporysz on 13.06.2017.
//  Copyright © 2017 Paweł Sporysz. All rights reserved.
//

import VIPERModules

class SimpleWireframe: VIPERWireframe<SimpleModuleBuilder>, SimpleWireframeInterface {
    
    // MARK: - Overrides
    
    override var storyboard:UIStoryboard! { return UIStoryboard.init(name: "Main", bundle: nil) }
    override var viewControllerID:String! { return "SimpleViewController" }
    
}
