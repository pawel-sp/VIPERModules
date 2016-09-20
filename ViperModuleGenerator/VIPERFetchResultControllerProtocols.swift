//
//  VIPERFetchResultControllerProtocols.swift
//  ViperModuleGenerator
//
//  Created by Paweł Sporysz on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import Foundation
import UIKit
import CoreData

// MARK: - Base Protocols

protocol VIPERFetchResultControllerViewInterface {
    
    func updateViewWithInfo(_ updateInfo:DataUpdateInfo)
    
}

protocol VIPERFetchResultControllerInteractorEventsInterface: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?)
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType)
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    
}

protocol VIPERFetchResultControllerInteractorEventsDelegate {
    
    var dataUpdateInfo:DataUpdateInfo? { get }
    
    func controllerDidChangeObjectAtIndexPath(_ indexPath: IndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: IndexPath?)
    func controllerDidChangeSectionInfoAtSectionIndex(_ sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType)
    func controllerWillChangeContent()
    func controllerDidChangeContent()
    
}

// MARK: - Extensions

extension VIPERTableViewController: VIPERFetchResultControllerViewInterface {
    
    func updateViewWithInfo(_ updateInfo:DataUpdateInfo) {
        tableView.beginUpdates()
        tableView.insertSections(updateInfo.insertedSections, with: animationForInsertedSections(updateInfo.insertedSections))
        tableView.deleteSections(updateInfo.deletedSections, with: animationForDeletedSections(updateInfo.deletedSections))
        tableView.insertRows(at: updateInfo.insertedIndexPaths.array, with: animationForInsertedIndexPaths(updateInfo.insertedIndexPaths.array))
        tableView.deleteRows(at: updateInfo.deletedIndexPaths.array, with: animationForDeletedIndexPaths(updateInfo.deletedIndexPaths.array))
        tableView.reloadRows(at: updateInfo.updatedIndexPaths.array, with: animationForReloadedIndexPaths(updateInfo.updatedIndexPaths.array))
        tableView.endUpdates()
    }
    
    func animationForInsertedSections(_ sectionsSet:IndexSet) -> UITableViewRowAnimation { return .automatic }
    func animationForDeletedSections(_ sectionsSet:IndexSet) -> UITableViewRowAnimation { return .automatic }
    func animationForInsertedIndexPaths(_ indexPaths:[IndexPath]) -> UITableViewRowAnimation { return .automatic }
    func animationForDeletedIndexPaths(_ indexPaths:[IndexPath]) -> UITableViewRowAnimation { return .automatic }
    func animationForReloadedIndexPaths(_ indexPaths:[IndexPath]) -> UITableViewRowAnimation { return .automatic }

}

extension VIPERCollectionViewController: VIPERFetchResultControllerViewInterface {
    
    func updateViewWithInfo(_ updateInfo:DataUpdateInfo) {
        collectionView?.performBatchUpdates({
            self.collectionView?.insertSections(updateInfo.insertedSections)
            self.collectionView?.deleteSections(updateInfo.insertedSections)
            self.collectionView?.insertItems(at: updateInfo.insertedIndexPaths.array)
            self.collectionView?.deleteItems(at: updateInfo.deletedIndexPaths.array)
            self.collectionView?.reloadItems(at: updateInfo.updatedIndexPaths.array)
        })
    }
    
}

extension VIPERInteractor: VIPERFetchResultControllerInteractorEventsInterface {
    
    var fetchResultControllerDelegate: VIPERFetchResultControllerInteractorEventsDelegate? {
        return _delegate as? VIPERFetchResultControllerInteractorEventsDelegate
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        fetchResultControllerDelegate?.controllerDidChangeObjectAtIndexPath(indexPath, forChangeType: type, newIndexPath: newIndexPath)
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        fetchResultControllerDelegate?.controllerDidChangeSectionInfoAtSectionIndex(sectionIndex, forChangeType: type)
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        fetchResultControllerDelegate?.controllerWillChangeContent()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        fetchResultControllerDelegate?.controllerDidChangeContent()
    }
    
}


