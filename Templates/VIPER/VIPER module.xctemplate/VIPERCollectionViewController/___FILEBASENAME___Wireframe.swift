//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import VIPERModules

class ___VARIABLE_moduleName___Wireframe: VIPERWireframe<___VARIABLE_moduleName___ModuleBuilder>, ___VARIABLE_moduleName___WireframeInterface {
    
    // MARK: - Overrides
    
    override var storyboard:UIStoryboard! { return UIStoryboard.init(name: "Main", bundle: nil) }
    override var viewControllerID:String! { return "___VARIABLE_moduleName___ViewController" }
    
}
