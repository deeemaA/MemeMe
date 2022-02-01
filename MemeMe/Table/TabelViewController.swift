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
            return memes.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "memeTableCell") as! memeTableViewCell
            let memes = self.memes[(indexPath as NSIndexPath).row]
            
            cell.topText.text = memes.topText
            cell.bottomText.text = memes.bottomText
            cell.memedImage.image = memes.memedImage
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let memeController = self.storyboard!.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
            memeController.meme = self.memes[(indexPath as NSIndexPath).row]
            self.navigationController!.pushViewController(memeController, animated: true)
        }
    
}
