//
//  UIView+LoadNib.swift
//  Carousel
//
//  Created by Sanjay on 5/9/22.
//

import Foundation
import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    func makeElevatedView(_ shadowRadius : CGFloat = 5) {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0.2, height: 0.2)
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = 0.5
    }
}

