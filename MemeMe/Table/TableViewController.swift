//
//  TableViewController.swift
//  MemeMe
//
//  Created by Deema Almutairi on 03/02/2022.
//

import UIKit

class TableViewController: UITableViewController {



    @IBOutlet weak var addButton: UIBarButtonItem!

//    var memes = (UIApplication.shared.delegate as! AppDelegate).memes
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
        tableView!.reloadData()
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Meme.getMemes().memes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell

        let meme = Meme.getMemes().memes[indexPath.row]

        cell.memedImage.image = meme.memedImage
        cell.topText.text = meme.topText
        cell.bottomText.text = meme.bottomText

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let details = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController

        details.meme = Meme.getMemes().memes[indexPath.row]

        navigationController?.pushViewController(details, animated: true)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }


}

