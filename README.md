#VIPERModuleGenerator

Easy way to generate and setup your modules using VIPER pattern architecture.


## Introduction

Here you can find description of VIPER pattern architecture [https://www.objc.io/issues/13-architecture/viper/](https://www.objc.io/issues/13-architecture/viper/).
VIPERModules extends that pattern:

- There is additional object called event handler responsible for passing all events (like selection) to interactor. In that case presenter should be responsible only for displaying and returning correct data (it shouldn't call events from interactor like "loadData" - now it's event handler responsibility)
- Protocol for interactor is now divided into 2 protocols: first one is responsible for events and second one is taking care of returning data for presenter.
- Every module has object called ModuleBuilder which is responsible for configuring all types within specified module.

You can run project and study prepared example module.

## Templates

To install templates for VIPER modules you need to copy ```Templates/VIPER``` folder to Xcode templates folder:

```
/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates
```

## Install

You can install VIPERModules via CococaPods, put that line to your Podfile:

```
pod 'VIPERModules', :git => "https://bitbucket.org/pawel-sp/vipermodulegenerator.git"
```

## UITableViewController, UICollectionViewController

Generated module view controller subclasses from VIPERViewController which is a regular UIViewController. VIPERModules supports UITableViewController and UICollectionViewController. The only thing you need to do that is to change base class for generated view controller to VIPERTableViewController or VIPERCollectionViewController.

## Example 
You can run iOS-Example project to check all features. There is also Unit Test Target where you can find how you can easily write unit tests covering module items.

## License

VIPERModules is released under the MIT license.
