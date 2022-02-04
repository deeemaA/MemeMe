//
//  DetailsViewController.swift
//  MemeMe
//
//  Created by Deema Almutairi on 03/02/2022.
//

import UIKit
// This class controlls the proccess of viewing a specefic meme's details by clicking on a cell in a table/collection
class DetailsViewController: UIViewController {

    @IBOutlet weak var memedImage: UIImageView!
    
    // to send the meme's info
    var meme: Meme!


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        
        // Assign the image to our view
        memedImage.image = meme.memedImage
    }
}

