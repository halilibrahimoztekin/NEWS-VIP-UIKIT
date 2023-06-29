//
//  DetailPageCollectionViewCell.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.
//

import UIKit

class DetailPageCollectionViewCell: UICollectionViewCell,ConfigurableCell {
    
    @IBOutlet var textLabel: UILabel!
    
    
    func configure(_ item:  [String : Any], at indexPath: IndexPath) {
        
        if let firstKeyValue = item.first{
            let (key, value) = firstKeyValue
            print("First Key: \(key)")
            print("First Value: \(value)")
            let stringValue = String(describing: value)
            textLabel.text = stringValue
        }
       
        
    }
}
