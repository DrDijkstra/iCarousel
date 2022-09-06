//
//  CarouselView.swift
//  Carousel
//
//  Created by Sanjay on 5/9/22.
//

import UIKit


protocol CarouseCollectionViewDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath])
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    
    
    
}


class CarouselView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.collectionView(collectionView, didSelectItemAt: indexPath)
    }
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         
         return delegate?.collectionView(collectionView, numberOfItemsInSection: section) ?? 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return delegate?.collectionView(collectionView, cellForItemAt: indexPath) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        delegate?.collectionView(collectionView, prefetchItemsAt: indexPaths)
        
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
 
    
    
    weak var delegate:CarouseCollectionViewDelegate?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
        

    }
    
    
    private func configureView(){
        let xibView = Bundle.main.loadNibNamed("CarouselView", owner: self, options: nil)?[0] as! UIView
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibView)
        initCollectionView()
    }
    
    

    

    
    
    
    
    func initCollectionView(){
        collectionView.register(UINib(nibName: "CaroucelCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CaroucelCollectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionView.reloadData()
    }
    


}
