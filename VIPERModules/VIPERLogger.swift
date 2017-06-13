//
//  VIPERLogger.swift
//  VIPERModules
//
//  Created by Paweł Sporysz on 13.06.2017.
//  Copyright © 2017 Paweł Sporysz. All rights reserved.
//

import Foundation

class VIPERLogger {
    
    static func fatal(_ message:String) -> Never {
        fatalError("VIPERModule: \(message)")
    }
    
    static func log(_ message:String) {
        print("VIPERModule: \(message)")
    }
    
}
