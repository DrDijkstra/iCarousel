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
        //goToMiddle()
        carouselView?.goToCellat(Index: strArr.count * 3000)
    }

    @IBAction func onButtonClick(_ sender: Any) {
        carouselView?.scrollToNextCell()
    }
    
   
    
        
    

    
}


extension ViewController:CarouseCollectionViewDelegate{
    func carouselView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func carouselView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8000000
    }
    
    func carouselView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = carouselView?.collectionView.dequeueReusableCell(withReuseIdentifier: "CaroucelCollectionCell", for: indexPath) as! CaroucelCollectionCell
        cell.holderView.backgroundColor = color[indexPath.row % strArr.count]
        cell.holderView.makeElevatedView()
        return cell
    }
    
    func carouselView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
    }
    
    
}



    


