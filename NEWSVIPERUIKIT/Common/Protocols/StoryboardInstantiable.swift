//
//  StoryboardInstantiable.swift
//  News-API-VIPER
//
//  Created by Halil İbrahim Öztekin on 28.06.2023.
//

import Foundation
import UIKit

protocol StoryboardInstantiable {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle? { get }
    static var storyboardIdentifier: String { get }
    static func instantiateFromStoryboard() -> Self
}

extension StoryboardInstantiable where Self: UIViewController {
    static var storyboardName: String {
        return String(describing: self)
    }
    
    static var storyboardBundle: Bundle? {
        return nil
    }
    static var storyboardIdentifier: String {
        return storyboardName
    }
    
    static func instantiateFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Could not instantiate view controller from storyboard.")
        }
        return viewController
    }
}
