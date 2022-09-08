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
        carouselView?.collectionView.reloadData()
    }


}


extension ViewController:CarouseCollectionViewDelegate{
    func carouselView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func carouselView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return strArr.count
    }
    
    func carouselView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = carouselView?.collectionView.dequeueReusableCell(withReuseIdentifier: "CaroucelCollectionCell", for: indexPath) as! CaroucelCollectionCell
        cell.holderView.backgroundColor = color[indexPath.row]
        cell.textLabel.text = strArr[indexPath.row]
        
        cell.holderView.makeElevatedView()
        
        
        
        
        return cell
    }
    
    func carouselView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
    }
    
    
}



    


