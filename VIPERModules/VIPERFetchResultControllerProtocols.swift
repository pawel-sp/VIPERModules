//
//  VIPERFetchResultControllerProtocols.swift
//  ViperModuleGenerator
//
//  Created by Paweł Sporysz on 19.09.2016.
//  Copyright (c) 2017 Paweł Sporysz
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import UIKit
import CoreData

// MARK: - Base Protocols

public protocol VIPERFetchResultControllerViewInterface {
    
    func updateViewWithInfo(_ updateInfo:VIPERFetchResultControllerUpdateInfo)
    
}

public protocol VIPERFetchResultControllerInteractorEventsInterface: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?)
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType)
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    
}

public protocol VIPERFetchResultControllerInteractorEventsDelegate {
    
    var dataUpdateInfo:VIPERFetchResultControllerUpdateInfo? { get }
    
    func controllerDidChangeObjectAtIndexPath(_ indexPath: IndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: IndexPath?)
    func controllerDidChangeSectionInfoAtSectionIndex(_ sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType)
    func controllerWillChangeContent()
    func controllerDidChangeContent()
    
}

// MARK: - Extensions

extension VIPERTableViewController: VIPERFetchResultControllerViewInterface {
    
    public func updateViewWithInfo(_ updateInfo:VIPERFetchResultControllerUpdateInfo) {
        tableView.beginUpdates()
        tableView.insertSections(updateInfo.insertedSections, with: animationForInsertedSections(updateInfo.insertedSections))
        tableView.deleteSections(updateInfo.deletedSections, with: animationForDeletedSections(updateInfo.deletedSections))
        tableView.insertRows(at: updateInfo.insertedIndexPaths.filter({ _ in true }), with: animationForInsertedIndexPaths(updateInfo.insertedIndexPaths.filter({ _ in true })))
        tableView.deleteRows(at: updateInfo.deletedIndexPaths.filter({ _ in true }), with: animationForDeletedIndexPaths(updateInfo.deletedIndexPaths.filter({ _ in true })))
        tableView.reloadRows(at: updateInfo.updatedIndexPaths.filter({ _ in true }), with: animationForReloadedIndexPaths(updateInfo.updatedIndexPaths.filter({ _ in true })))
        tableView.endUpdates()
    }
    
    open func animationForInsertedSections(_ sectionsSet:IndexSet) -> UITableViewRowAnimation { return .automatic }
    open func animationForDeletedSections(_ sectionsSet:IndexSet) -> UITableViewRowAnimation { return .automatic }
    open func animationForInsertedIndexPaths(_ indexPaths:[IndexPath]) -> UITableViewRowAnimation { return .automatic }
    open func animationForDeletedIndexPaths(_ indexPaths:[IndexPath]) -> UITableViewRowAnimation { return .automatic }
    open func animationForReloadedIndexPaths(_ indexPaths:[IndexPath]) -> UITableViewRowAnimation { return .automatic }

}

extension VIPERCollectionViewController: VIPERFetchResultControllerViewInterface {
    
    public func updateViewWithInfo(_ updateInfo:VIPERFetchResultControllerUpdateInfo) {
        collectionView?.performBatchUpdates({
            self.collectionView?.insertSections(updateInfo.insertedSections)
            self.collectionView?.deleteSections(updateInfo.insertedSections)
            self.collectionView?.insertItems(at: updateInfo.insertedIndexPaths.filter({ _ in true }))
            self.collectionView?.deleteItems(at: updateInfo.deletedIndexPaths.filter({ _ in true }))
            self.collectionView?.reloadItems(at: updateInfo.updatedIndexPaths.filter({ _ in true }))
        })
    }
    
}

extension VIPERInteractor: VIPERFetchResultControllerInteractorEventsInterface {
    
    var fetchResultControllerDelegate: VIPERFetchResultControllerInteractorEventsDelegate? {
        return _delegate as? VIPERFetchResultControllerInteractorEventsDelegate
    }
    
    public func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        fetchResultControllerDelegate?.controllerDidChangeObjectAtIndexPath(indexPath, forChangeType: type, newIndexPath: newIndexPath)
    }
    
    public func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        fetchResultControllerDelegate?.controllerDidChangeSectionInfoAtSectionIndex(sectionIndex, forChangeType: type)
    }
    
    public func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        fetchResultControllerDelegate?.controllerWillChangeContent()
    }
    
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        fetchResultControllerDelegate?.controllerDidChangeContent()
    }
    
}


