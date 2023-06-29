//
//  String+Extension.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.
//

import Foundation


extension String? {
    var unwrapWithEmpty : String {
        if let self = self {
            return self
        }
        return ""
    }
}
