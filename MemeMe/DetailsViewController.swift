//
//  DetailsViewController.swift
//  MemeMe
//
//  Created by Deema Almutairi on 03/02/2022.
//

import UIKit

class MemeDetailViewController: UIViewController {

    //MARK: Outlets & Properties

    @IBOutlet weak var memedImage: UIImageView!
    var meme: Meme! = nil

    //MARK: LifeCycle Methods

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //Hide Tab Bar Controller Here
        tabBarController?.tabBar.isHidden = true

        //Set the memed Image to show
        memedImage.image = meme.memedImage
    }
}
