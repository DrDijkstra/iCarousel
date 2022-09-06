//
//  ViewController.swift
//  Carousel
//
//  Created by Sanjay on 4/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var carouselView: CarouselView!
    
    
    var strArr:[String] = ["asd", "asd", "asdds", "sd", "sd", "asdf", "asdf", "sad"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        carouselView.delegate = self
       

    

      
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
        cell.textLabel.text = strArr[indexPath.row]
        return cell
    }
    
    func carouselView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
    }
    
    
}



    


