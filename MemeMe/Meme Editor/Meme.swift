//
//  Meme.swift
//  MemeMe
//
//  Created by Deema Almutairi on 03/02/2022.
//

import UIKit

struct Meme {

    var topText: String!
    var bottomText: String!
    let image: UIImage!
    var memedImage: UIImage!

    static func getMemes() -> AppDelegate {
      return (UIApplication.shared.delegate as! AppDelegate)
    }
}
