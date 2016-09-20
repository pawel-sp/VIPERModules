//
//  VIPERFetchResultControllerProtocols.swift
//  ViperModuleGenerator
//
//  Created by Paweł Sporysz on 19.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import Foundation
import CoreData

// MARK: - Base Protocols

protocol VIPERFetchResultControllerViewInterface {
    
    func beginViewUpdates()
    func endViewUpdates()
    func reloadCellsAtIndexPaths(_ indexPaths: [IndexPath])
    func insertCellsAtIndexPaths(_ indexPaths: [IndexPath])
    func deleteCellsAtIndexPaths(_ indexPaths: [IndexPath])
    
}

protocol VIPERFetchResultControllerInteractorEventsInterface: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?)
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType)
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    
}

protocol VIPERFetchResultControllerInteractorEventsDelegate {
    
    func controllerDidChangeObject(anObject: Any, atIndexPath indexPath: IndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: IndexPath?)
    func controllerDidChangeSectionInfo(sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex: Int, forChangeType type: NSFetchedResultsChangeType)
    func controllerWillChangeContent()
    func controllerDidChangeContent()
    
}

// MARK: - Extensions

extension VIPERTableViewController: VIPERFetchResultControllerViewInterface {
    
    func beginViewUpdates() {
        tableView.beginUpdates()
    }
    
    func endViewUpdates() {
        tableView.endUpdates()
    }
    
    func reloadCellsAtIndexPaths(_ indexPaths: [IndexPath]) {
        tableView.reloadRows(at: indexPaths, with: .automatic)
    }
    
    func insertCellsAtIndexPaths(_ indexPaths: [IndexPath]) {
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    func deleteCellsAtIndexPaths(_ indexPaths: [IndexPath]) {
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
}

extension VIPERCollectionViewController: VIPERFetchResultControllerViewInterface {
    
    func beginViewUpdates() {}
    
    func endViewUpdates() {}
    
    func reloadCellsAtIndexPaths(_ indexPaths: [IndexPath]) {
        collectionView?.reloadItems(at: indexPaths)
    }
    
    func insertCellsAtIndexPaths(_ indexPaths: [IndexPath]) {
        collectionView?.insertItems(at: indexPaths)
    }
    
    func deleteCellsAtIndexPaths(_ indexPaths: [IndexPath]) {
        collectionView?.deleteItems(at: indexPaths)
    }
    
}

extension VIPERPresenter: VIPERFetchResultControllerInteractorEventsDelegate {
    
    var fetchResultControllerViewInterface: VIPERFetchResultControllerViewInterface? {
        return _viewInterface as? VIPERFetchResultControllerViewInterface
    }
    
    func controllerDidChangeObject(anObject: Any, atIndexPath indexPath: IndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
            case .insert:
                guard let newIndexPath = newIndexPath else { break }
                fetchResultControllerViewInterface?.insertCellsAtIndexPaths([newIndexPath])
            case .update:
                guard let indexPath = indexPath else { break }
                fetchResultControllerViewInterface?.reloadCellsAtIndexPaths([indexPath])
            case .delete:
                guard let indexPath = indexPath else { break }
                fetchResultControllerViewInterface?.deleteCellsAtIndexPaths([indexPath])
            case .move:
                guard let indexPath = indexPath, let newIndexPath = newIndexPath else { break }
                fetchResultControllerViewInterface?.deleteCellsAtIndexPaths([indexPath])
                fetchResultControllerViewInterface?.insertCellsAtIndexPaths([newIndexPath])
        }
    }
    
    func controllerDidChangeSectionInfo(sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
      
    }
    
    func controllerWillChangeContent() {
        fetchResultControllerViewInterface?.beginViewUpdates()
    }
    
    func controllerDidChangeContent() {
        fetchResultControllerViewInterface?.endViewUpdates()
    }
    
}

extension VIPERInteractor: VIPERFetchResultControllerInteractorEventsInterface {
    
    var fetchResultControllerDelegate: VIPERFetchResultControllerInteractorEventsDelegate? {
        return _delegate as? VIPERFetchResultControllerInteractorEventsDelegate
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        fetchResultControllerDelegate?.controllerDidChangeObject(anObject: anObject, atIndexPath: indexPath, forChangeType: type, newIndexPath: newIndexPath)
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        fetchResultControllerDelegate?.controllerDidChangeSectionInfo(sectionInfo: sectionInfo, atSectionIndex: sectionIndex, forChangeType: type)
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        fetchResultControllerDelegate?.controllerWillChangeContent()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        fetchResultControllerDelegate?.controllerDidChangeContent()
    }
    
}


