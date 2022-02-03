//
//  CollectionViewCell.swift
//  MemeMe
//
//  Created by Deema Almutairi on 03/02/2022.
//

import UIKit

class SentMemesCollectionViewCell: UICollectionViewCell {

    //MARK: Outlets

    @IBOutlet weak var memedImage: UIImageView!

    //MARK: Custom Cell's Functions

    func updateCell(_ meme: Meme) {

        //update cell's view
        memedImage.image = meme.memedImage
    }
}
