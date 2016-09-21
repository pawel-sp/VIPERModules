#VIPERModuleGenerator

Easy way to generate and setup your modules using VIPER pattern architecture.


## Introduction

Here you can find description of VIPER pattern architecture [https://www.objc.io/issues/13-architecture/viper/](https://www.objc.io/issues/13-architecture/viper/).
VIPERModuleGenerator extends that pattern:

- There is additional object called event handler responsible for passing all events (like selection) to interactor. In that case presenter should be responsible only for displaying and returning correct data (it shouldn't call events from interactor like "loadData" - now it's event handler responsibility)
- Protocol for interactor is now divided into 2 protocols: first one is responsible for events and second one is taking care of returning data for presenter.

You can run project and study prepared example module.

## Templates

To install templates for VIPER modules you need to copy ```Templates/Viper``` folder to Xcode templates folder:

```
/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates
```
There are templates for supporting UIViewController, UITableViewController and UICollectionViewController

## Install

You can install VIPERModules via CococaPods, put that line to your Podfile:

```
pod 'VIPERModules', :git => "https://bitbucket.org/pawel-sp/vipermodulegenerator.git"
```

## Creating modules

There are few steps which you need to do to create new module:

- Create new file using VIPER templates. After that you should see 8 new files which represent all layers of single VIPER module
- You shouldn't change file called ABCModuleSetup.swift. There are typealiases setup for whole module. 

## NSFetchResultController

VIPERModules supports NSFetchResultController. After creating new module files using Templates you need to do following things:

- Add another base protocol to NewModuleViewInterface protocol -> VIPERFetchResultControllerViewInterface (NewModuleProtocols.swift)
- Add another base protocol to NewModuleInteractorEventsInterface protocol -> VIPERFetchResultControllerInteractorEventsInterface (NewModuleProtocols.swift)
- Add another base protocol to NewModuleInteractorDelegate protocol -> VIPERFetchResultControllerInteractorEventsDelegate (NewModuleProtocols.swift)
- Change base class for NewModulePresenter from VIPERPresenter to VIPERFetchResultControllerPresenter
- Assign your delegate of NSFetchResultController object to interactor.

There is no additional code to put into modules, all parts responsible for refreshing view are inside extensions. The only thing you need to take care of is add/remove/change object using NSFetchResultController object.

## Example 
You can run iOS-Example project to check all features. There are two separate modules:

- First one is the easiest possible module only to show dependencies between module parts
- Second one presents how to use NSFetchResultController with VIPERModules
