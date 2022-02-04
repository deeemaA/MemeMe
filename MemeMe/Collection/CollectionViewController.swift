//
//  CollectionViewController.swift
//  MemeMe
//
//  Created by Deema Almutairi on 03/02/2022.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

    //var memes = (UIApplication.shared.delegate as! AppDelegate).memes
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let space: CGFloat
        let dimension: CGFloat


        if (UIDevice.current.orientation.isPortrait) {
            space = 3.0
            dimension = (view.frame.size.width - (2 * space)) / 3 //3 per line
        } else {
            space = 1.0
            dimension = (view.frame.size.width - (1 * space)) / 5
        }

        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
        collectionView?.reloadData()
    }



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Meme.getMemes().memes.count
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell

        let meme = Meme.getMemes().memes[indexPath.item]

        cell.memedImage.image = meme.memedImage

        return cell

    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let details = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController

        details.meme = Meme.getMemes().memes[indexPath.row]

        navigationController?.pushViewController(details, animated: true)
    }
}

