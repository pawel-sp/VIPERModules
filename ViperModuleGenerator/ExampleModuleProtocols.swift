//
//  ExampleModuleProtocols.swift
//  ViperUKswift3
//
//  Created by Paweł Sporysz on 08.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

protocol ExampleWireframeInterface: VIPERCustomWireframeInterface {
    
}

protocol ExampleViewInterface:VIPERCustomViewInterface {
    
}

protocol ExamplePresenterInterface:VIPERCustomPresenterInterface, VIPERInteractorDelegate {
    
}

protocol ExampleEventHandlerInterface:VIPERCustomEventHandlerInterface {
    
    func didSelectButton()
    
}

protocol ExampleInteractorEventsInterface:VIPERCustomInteractorEventsInterface {
    
}

protocol ExampleInteractorDataSourceInterface:VIPERCustomInteractorDataSourceInterface {
    
}

protocol ExampleInteractorDelegate:VIPERCustomInteractorDelegate {
    
}
