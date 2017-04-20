//
//  VIPERFetchResultControllerClasses.swift
//  ViperModuleGenerator
//
//  Created by Paweł Sporysz on 20.09.2016.
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
import CoreData

public struct VIPERFetchResultControllerUpdateInfo {
    
    var insertedSections   = IndexSet()
    var deletedSections    = IndexSet()
    var insertedIndexPaths = Set<IndexPath>()
    var deletedIndexPaths  = Set<IndexPath>()
    var updatedIndexPaths  = Set<IndexPath>()
    
    func hasChanges() -> Bool {
        if insertedSections.count > 0   { return true }
        if deletedSections.count > 0    { return true }
        if insertedIndexPaths.count > 0 { return true }
        if deletedIndexPaths.count > 0  { return true }
        if updatedIndexPaths.count > 0  { return true }
        return false
    }
}

open class VIPERFetchResultControllerPresenter: VIPERPresenter, VIPERFetchResultControllerInteractorEventsDelegate {
    
    // MARK: - Properties
    
    var fetchResultControllerViewInterface: VIPERFetchResultControllerViewInterface? {
        return _viewInterface as? VIPERFetchResultControllerViewInterface
    }
    
    // MARK: - VIPERFetchResultControllerInteractorEventsDelegate
    
    public var dataUpdateInfo:VIPERFetchResultControllerUpdateInfo?
    
    public func controllerDidChangeObjectAtIndexPath(_ indexPath: IndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
            case .insert:
                guard let newIndexPath = newIndexPath else { break }
                dataUpdateInfo?.insertedIndexPaths.insert(newIndexPath)
            case .update:
                guard let indexPath = indexPath else { break }
                dataUpdateInfo?.updatedIndexPaths.insert(indexPath)
            case .delete:
                guard let indexPath = indexPath else { break }
                dataUpdateInfo?.deletedIndexPaths.insert(indexPath)
            case .move:
                guard let indexPath = indexPath, let newIndexPath = newIndexPath else { break }
                dataUpdateInfo?.deletedIndexPaths.insert(indexPath)
                dataUpdateInfo?.insertedIndexPaths.insert(newIndexPath)
        }
    }
    
    public func controllerDidChangeSectionInfoAtSectionIndex(_ sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch (type) {
            case .insert:
                dataUpdateInfo?.insertedSections.insert(sectionIndex)
            case .delete:
                dataUpdateInfo?.deletedSections.insert(sectionIndex)
            case .move:
                break
            case .update:
                break
        }
    }
    
    public func controllerWillChangeContent() {
        dataUpdateInfo = VIPERFetchResultControllerUpdateInfo()
    }
    
    public func controllerDidChangeContent() {
        if let updateInfo = dataUpdateInfo {
            fetchResultControllerViewInterface?.updateViewWithInfo(updateInfo)
        }
        dataUpdateInfo = nil
    }
    
}
