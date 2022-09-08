//
//  CarouselView.swift
//  Carousel
//
//  Created by Sanjay on 5/9/22.
//

import UIKit


public protocol CarouseCollectionViewDelegate: AnyObject {
    func carouselView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func carouselView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func carouselView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath])
    func carouselView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}

extension CarouseCollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
    }
}


open class CarouselView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.collectionView(collectionView, didSelectItemAt: indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         
         return delegate?.carouselView(collectionView, numberOfItemsInSection: section) ?? 0
    }
    
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return delegate?.carouselView(collectionView, cellForItemAt: indexPath) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        delegate?.carouselView(collectionView, prefetchItemsAt: indexPaths)
        
    }
    
    
    @IBOutlet weak public var collectionView: UICollectionView!
    
    
 
    
    
    weak public var delegate:CarouseCollectionViewDelegate?
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
        

    }
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    
    private func configureView(){
//        let xibView = Bundle.main.loadNibNamed("CarouselView", owner: self, options: nil)?[0] as! UIView
        
       
 
        
        
        if let urlString = Bundle.main.path(forResource: "CardCarousel", ofType: "framework", inDirectory: "Frameworks") {
                    let bundle = (Bundle(url: NSURL(fileURLWithPath: urlString) as URL))
                    let nib = UINib(nibName: "CarouselView", bundle: bundle)
            guard let xibView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
                    fatalError("Failed to instantiate nib \(nib)")
                }
            
            xibView.frame = self.bounds
            xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(xibView)
            initCollectionView()
            
            
            
        }
        
        

        
 

        
        
        
    }
    
    

    

    
    
    
    
    func initCollectionView(){
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.transform = CGAffineTransform(scaleX:-1,y: 1);
        
    }
    


}
