//
//  CollectionViewController.swift
//  MemeMe
//
//  Created by Deema Almutairi on 29/01/2022.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
}
