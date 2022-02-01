//
//  memeTableViewCell.swift
//  MemeMe
//
//  Created by Deema Almutairi on 02/02/2022.
//

import UIKit

class memeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var memedImage: UIImageView!
    @IBOutlet weak var topText: UILabel!
    @IBOutlet weak var bottomText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
