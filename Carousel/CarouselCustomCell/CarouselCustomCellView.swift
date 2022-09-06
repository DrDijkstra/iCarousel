//
//  CaroucelCollectionViewCell.swift
//  Carousel
//
//  Created by Sanjay on 4/9/22.
//

import UIKit

@IBDesignable
class CaroucelCollectionCellView: UIView {
    
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textLabel: UILabel!
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        textLabel.text = "asdasdsd"
        print("CaroucelCollectionCellView")
    }

    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
