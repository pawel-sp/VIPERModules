//
//  ExampleEventHandler.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 13.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import Foundation

class ExampleEventHandler: VIPEREventHandler, ExampleEventHandlerInterface {
    
    func didSelectButton() {
        print("OK")
    }
    
}
