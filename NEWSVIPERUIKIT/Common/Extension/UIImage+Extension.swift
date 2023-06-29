//
//  UIIMAGE+Extension.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func setImage(with url: URL?, placeholder: UIImage? = UIImage(named: "noImage"), completion: (() -> Void)? = nil) {
        self.sd_setImage(with: url, placeholderImage: placeholder, options: .highPriority) { (_, _, _, _) in
            completion?()
        }
    }
}
