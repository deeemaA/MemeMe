//
//  MemeViewController.swift
//  MemeMe
//
//  Created by Deema Almutairi on 01/02/2022.
//

import Foundation
import UIKit

class MemeViewController: UIViewController{
    
    @IBOutlet weak var memedImage: UIImageView!
    var meme: Meme!

    //MARK: LifeCycle Methods

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        
        memedImage.image = meme.memedImage
    }
    
    
}
