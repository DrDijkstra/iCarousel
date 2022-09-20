//
//  ViewController.swift
//  Carousel
//
//  Created by Sanjay on 4/9/22.
//

import UIKit
import CardCarousel


class ViewController: UIViewController {
    
    
    @IBOutlet weak var carouselHolderView: UIView!
    
    var carouselView:CarouselView?
    
    var strArr:[String] = ["asd", "asd", "asdds", "sd", "sd", "asdf", "asdf", "sad"]
    var color:[UIColor] = [.blue, .brown, .cyan, .darkGray, .green, .red, .purple, .magenta]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        carouselView = CarouselView(frame: carouselHolderView.frame)
        carouselView?.delegate = self
        carouselView?.collectionView.register(UINib(nibName: "CaroucelCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CaroucelCollectionCell")
        
        carouselHolderView.addSubview(carouselView ?? UIView())
        
        


    

      
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        goToMiddle()
    }

    @IBAction func onButtonClick(_ sender: Any) {
        
        print("hello")
//        if carouselView?.collectionView?.dataSource?.collectionView(carouselView!.collectionView!, cellForItemAt: IndexPath(row: 0, section: 0)) != nil {
//            let rect = carouselView?.collectionView.layoutAttributesForItem(at: IndexPath(item: strArr.count * 1000, section: 0))?.frame
//
//            print("react", rect)
//            carouselView?.collectionView.isPagingEnabled = false
//            carouselView!.collectionView.scrollRectToVisible(rect!, animated: true)
//            carouselView?.collectionView.setNeedsLayout()
//            //carouselView?.collectionView.isPagingEnabled = true
//            }
        scrollToNextCell()
    }
    
    var nextItem = 0
    
    func scrollToNextCell(){
        
        

            //get Collection View Instance
        let collectionView:UICollectionView = (carouselView?.collectionView)!;

            //get cell size
        let cellSize = CGSize(width: self.view.frame.width, height: self.view.frame.height);

            //get current content Offset of the Collection view
        let contentOffset = collectionView.contentOffset;
        
        

        

        let flowlayout = (collectionView.collectionViewLayout as! CarouselCollectionViewFlowLayout)
        
        
        flowlayout.currenCellIndex += 1

        
        
        print("next item", nextItem, "current cell", flowlayout.currenCellIndex)

        
        
        
        collectionView.scrollRectToVisible(CGRect(x: CGFloat((carouselView?.getCurrentIndex() ?? 0) + 1) * (cellSize.width + 24.0), y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true);



        }
    
    
    func goToMiddle(){
        
        let collectionView:UICollectionView = (carouselView?.collectionView)!;

            //get cell size
        let cellSize = CGSize(width: self.view.frame.width, height: self.view.frame.height);

            //get current content Offset of the Collection view
        let contentOffset = collectionView.contentOffset;
        
       
        
        print("cell size", cellSize, "contentOffset", contentOffset)

            //scroll to next cell
        //collectionView.isPagingEnabled = false
         
        nextItem = strArr.count * 3000
        
        collectionView.scrollRectToVisible(CGRect(x: CGFloat(nextItem) * (cellSize.width + 24.0), y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: false);
        
    }

    
}


extension ViewController:CarouseCollectionViewDelegate{
    func carouselView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func carouselView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int.max
    }
    
    func carouselView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = carouselView?.collectionView.dequeueReusableCell(withReuseIdentifier: "CaroucelCollectionCell", for: indexPath) as! CaroucelCollectionCell
        cell.holderView.backgroundColor = color[indexPath.row % strArr.count]
        cell.textLabel.text = strArr[indexPath.row % strArr.count]
        
        cell.holderView.makeElevatedView()
        
        
        
        
        return cell
    }
    
    func carouselView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
    }
    
    
}



    


