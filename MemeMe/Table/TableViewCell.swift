//
//  TableViewCell.swift
//  MemeMe
//
//  Created by Deema Almutairi on 03/02/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

        @IBOutlet weak var memedImage: UIImageView!
        @IBOutlet weak var topText: UILabel!
        @IBOutlet weak var bottomText: UILabel!

        //MARK: Custom Cell's Functions

        func updateCell(_ meme: Meme) {

            //update cell's view
            memedImage.image = meme.memedImage
            topText.text = meme.topText as String?
            bottomText.text = meme.bottomText as String?
        }
}
