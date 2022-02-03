//
//  Meme.swift
//  MemeMe
//
//  Created by Deema Almutairi on 03/02/2022.
//

import UIKit

struct Meme {

    var topText: NSString!
    var bottomText: NSString!
    let image: UIImage!
    var memedImage: UIImage!


    //Get a count of all Memes
    static func count() -> Int {
        return getMemeStorage().memes.count
    }

    //Locate the Meme storage location
    static func getMemeStorage() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}
