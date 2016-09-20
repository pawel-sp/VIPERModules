//
//  Set+Array.swift
//  ViperModuleGenerator
//
//  Created by Paweł Sporysz on 20.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import Foundation

extension Set {
    
    var array: [Element] {
        return filter({ _ in true }) ?? []
    }
    
}
