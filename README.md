## Introduction

Here you can find description of VIPER pattern architecture [https://www.objc.io/issues/13-architecture/viper/](https://www.objc.io/issues/13-architecture/viper/).
VIPERModules extends that pattern:

- There is additional object called event handler responsible for passing all events (like selection) to interactor. In that case presenter should be responsible only for displaying and returning correct data (it shouldn't call events from interactor like "loadData" - now it's event handler responsibility)
- Protocol for interactor is now divided into 2 protocols: first one is responsible for events and second one is taking care of returning data for presenter.
- Every module has object called ModuleBuilder which is responsible for configuring all types within specified module.

You can run project and study prepared example module.

## Versions

There are 2 working versions of VIPERModules available on following branches:

- **master** is an official version of VIPERModules
- **view_modeling** is a version with view models support

## Templates

To install templates for VIPER modules you need to copy ```Templates/VIPER``` folder to Xcode templates folder:

```
~/Library/Developer/Xcode/Templates/
```

## UITableViewController, UICollectionViewController

VIPERModules supports UITableViewController and UICollectionViewController. During files creation from template you can choose different base view controller (there are following options: VIPERViewController, VIPERTableViewController and VIPERCollectionViewController).

## Example 
You can run iOS-Example project to check all features. There is also Unit Test Target where you can find how you can easily write unit tests covering module items.

## License

VIPERModules is released under the MIT license.
