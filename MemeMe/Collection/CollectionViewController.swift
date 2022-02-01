//
//  CollectionViewController.swift
//  MemeMe
//
//  Created by Deema Almutairi on 29/01/2022.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController, UINavigationControllerDelegate , UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0

        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    
//Note: This is a sample implementation. You will need to tinker with it to find
//    a layout that works in both landscape and portrait.
//Hint: consider using view.frame.size.height in addition to view.frame.size.width.
 
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return memes.count
        
    }

    //MARK: UICollectionViews Delegates

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCollectionCell", for: indexPath) as! memeCollectionViewCell
        let memes = self.memes[(indexPath as NSIndexPath).row]
        
        cell.memedImage.image = memes.memedImage
        
        return cell
    }

     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let memeController = self.storyboard!.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
         memeController.meme = self.memes[(indexPath as NSIndexPath).row]
         self.navigationController!.pushViewController(memeController, animated: true)
    }
}
