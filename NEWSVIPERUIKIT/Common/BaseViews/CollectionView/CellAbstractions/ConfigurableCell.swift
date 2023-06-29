//
//  BaseCollectionViewCell.swift
//  News-API-VIPER
//
//  Created by Halil İbrahim Öztekin on 28.06.2023.
//

import Foundation
import UIKit

public protocol ConfigurableCell: ReusableCell {
    associatedtype T

    func configure(_ item: T, at indexPath: IndexPath)
}

