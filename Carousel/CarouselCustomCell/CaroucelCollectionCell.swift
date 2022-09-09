//
//  CaroucelCollectionCell.swift
//  Carousel
//
//  Created by Sanjay on 5/9/22.
//

import UIKit

class CaroucelCollectionCell: UICollectionViewCell {
    
    

    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        //self.holderView.transform = CGAffineTransform(scaleX: -1, y: 1)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
    
    
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
}
