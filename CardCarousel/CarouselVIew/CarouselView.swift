//
//  CarouselView.swift
//  Carousel
//
//  Created by Sanjay on 5/9/22.
//

import UIKit
import Foundation

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
    
    public func scrollToNextCell(){
        

            //get cell size
        
        
        let cellSize =  CGSize(width: UIScreen.main.bounds.width, height: self.frame.height);

            //get current content Offset of the Collection view
        let contentOffset = collectionView.contentOffset;
        
        
        print("cell size", cellSize)
        

        let flowlayout = (collectionView.collectionViewLayout as! CarouselCollectionViewFlowLayout)
        
        
        //flowlayout.currenCellIndex += 1

        
        
        //print("next item", nextItem, "current cell", flowlayout.currenCellIndex)

        print("currentIndex", getCurrentIndex())
        
        
        collectionView.scrollRectToVisible(CGRect(x: CGFloat((getCurrentIndex()) + 1) * (cellSize.width + 24.0), y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true);



        }
    
    
    public func goToCellat(Index: Int){
        
        //let collectionView:UICollectionView = (carouselView?.collectionView)!;

            //get cell size
        let cellSize = CGSize(width: UIScreen.main.bounds.width, height: self.frame.height);

            //get current content Offset of the Collection view
        let contentOffset = collectionView.contentOffset;
        
       
        
        //print("cell size", cellSize, "contentOffset", contentOffset)

            //scroll to next cell
        //collectionView.isPagingEnabled = false
         
        //nextItem = strArr.count * 3000
        
        collectionView.scrollRectToVisible(CGRect(x: CGFloat(Index) * (cellSize.width + 24.0), y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: false);
        
    }

    

    
    
    public func getCurrentIndex()->Int{
        var minIndex = Int.max
        
        for cell in collectionView.visibleCells {
            let indexPath = collectionView.indexPath(for: cell)
            
            if minIndex > indexPath!.row{
                minIndex = indexPath!.row
            }
        }
        
        return minIndex
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
