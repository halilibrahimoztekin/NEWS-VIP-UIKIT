//
//  ArrayDataProvider.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.
//

import Foundation
import UIKit

public class ArrayDataProvider<T>: CollectionDataProvider {
    // MARK: - Internal Properties
    var items: [[T]] = []

    // MARK: - Lifecycle
    init(array: [[T]]) {
        items = array
    }

    // MARK: - CollectionDataProvider
    public func numberOfSections() -> Int {
        return items.count
    }

    public func numberOfItems(in section: Int) -> Int {
        guard section >= 0 && section < items.count else {
            return 0
        }
        return items[section].count
    }

    public func item(at indexPath: IndexPath) -> T? {
        guard indexPath.section >= 0 && indexPath.section < items.count &&
            indexPath.row >= 0 && indexPath.row < items[indexPath.section].count else {
            return nil
        }
        return items[indexPath.section][indexPath.row]
    }

    public func updateItem(at indexPath: IndexPath, value: T) {
        guard indexPath.section >= 0 && indexPath.section < items.count &&
            indexPath.row >= 0 && indexPath.row < items[indexPath.section].count else {
            return
        }
        items[indexPath.section][indexPath.row] = value
    }
}
