//
//  DetailsViewController.swift
//  MemeMe
//
//  Created by Deema Almutairi on 03/02/2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var memedImage: UIImageView!
    var meme: Meme! = nil


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tabBarController?.tabBar.isHidden = true
        memedImage.image = meme.memedImage
    }
}

