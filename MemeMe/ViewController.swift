//
//  ViewController.swift
//  MemeMe
//
//  Created by Deema Almutairi on 09/09/2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    struct Meme {
        var topText : String
        var bottomText : String
        var originalImage : UIImage
        var memedImage : UIImage
    }
    
    func save(){
        // Create the meme
        let memedImage = generateMemedImage()
               let meme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, originalImage: imagePickerView.image!, memedImage: memedImage)
    }
    
    func generateMemedImage() -> UIImage {
        // TODO: Hide toolbar and navbar
        navBar.isHidden = true
        toolBar.isHidden = true
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        // TODO: Show toolbar and navbar
        navBar.isHidden = false
        toolBar.isHidden = false
        return memedImage
    }
    
    let memeTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor: UIColor.black ,
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedString.Key.strokeWidth:  -3.0
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
        
        topTextField.delegate = self
        bottomTextField.delegate = self
        
        bottomTextField.textAlignment = .center
        topTextField.textAlignment = .center
        
        topTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.defaultTextAttributes = memeTextAttributes
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
        shareButton.isEnabled = false
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
    }


    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        unsubscribeFromKeyboardNotifications()
        
    }
   
    @IBAction func pickAnImageFromAlbum(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            imagePickerView.image = image
        }
        if imagePickerView.image != nil{
            shareButton.isEnabled = true
        }
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    
    
    
    func subscribeToKeyboardNotifications() {

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    func unsubscribeFromKeyboardNotifications() {

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillShow(_ notification:Notification) {
        view.frame.origin.y -= getKeyboardHeight(notification)
    }
    @objc func keyboardWillHide(_ notification:Notification){
        view.frame.origin.y = 0
    }
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {

        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    @IBAction func shareMeme(_ sender: Any) {
        let image = generateMemedImage()
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
        activityController.isModalInPresentation = true
        activityController.popoverPresentationController?.barButtonItem = shareButton
        activityController.completionWithItemsHandler = {( type, ok, items, error ) in
                    if ok {
                        self.save()
                    }
                }
    }
    
    @IBAction func cancelMeme(_ sender: Any) {
        shareButton.isEnabled = false
        imagePickerView.image = nil
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

