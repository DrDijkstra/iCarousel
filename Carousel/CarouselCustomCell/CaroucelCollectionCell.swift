//
//  CaroucelCollectionCell.swift
//  Carousel
//
//  Created by Sanjay on 5/9/22.
//

import UIKit

class CaroucelCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet var textLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
}
