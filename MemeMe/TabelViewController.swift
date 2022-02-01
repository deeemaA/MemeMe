//
//  TabelViewController.swift
//  MemeMe
//
//  Created by Deema Almutairi on 29/01/2022.
//

import Foundation
import UIKit

class TabelViewController: UIViewController, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate  {
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
  
        // MARK: Table View Data Source
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.memes.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "memeCell")!
            let memes = self.memes[(indexPath as NSIndexPath).row]
            
            // Set the name and image
            cell.textLabel?.text = memes.topText
//            cell.imageView?.image = UIImage(memes.originalImage)
            cell.imageView?.image = memes.memedImage
//            cell.bottomLabel?.text = memes.bottomText
            
//            // If the cell has a detail label, we will put the evil scheme in.
//            if let detailTextLabel = cell.detailTextLabel {
//                detailTextLabel.text = "Scheme: \(villain.evilScheme)"
//            }
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let memeController = self.storyboard!.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
            memeController.meme = self.memes[(indexPath as NSIndexPath).row]
            self.navigationController!.pushViewController(memeController, animated: true)
        }
    
}
