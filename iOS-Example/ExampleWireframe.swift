//
//  ExampleWireframe.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 13.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit
import VIPERModules

class ExampleWireframe: VIPERWireframe, ExampleWireframeInterface {

    // MARK: - ExampleWireframeInterface
    
    var storyboard:UIStoryboard { return UIStoryboard.init(name: "Main", bundle: nil) }
    var viewControllerID:String { return "ExampleViewController" }
    
    // MARK: - Utilities
    
    func customModule(dataLimit:Int) ->  ExampleViewController {
        return customModule(
            presenterInitBlock: nil,
            eventHandlerInitBlock: nil,
            interactorInitBlock: nil,
            dataManagerInitBlock: { return $0.init(dataLimit:dataLimit) }
        )
    }
    
}
