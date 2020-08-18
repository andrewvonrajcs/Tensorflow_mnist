//
//  ViewController.swift
//  FoodTracker
//
//  Created by andrew von Rajcs on 7/29/20.
//  Copyright © 2020 andrew von Rajcs. All rights reserved.
//
import Photos
import UIKit

class ViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    // Handle the text field’s user input through delegate callbacks.
  nameTextField.delegate = self
    }
//MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
//MARK: UIImagePickerControllerDelegate
   // internal func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        //dismiss(animated: true, completion: nil)
    //}
   // private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       
       // The info dictionary may contain multiple representations of the image. You want to use the original.
        //guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage else {
       // fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
    //}
       
       // Set photoImageView to display the selected image.
      // photoImageView.image = selectedImage
      
        // Dismiss the picker.
       //dismiss(animated: true, completion: nil)
   //}
    
    //show alert to selected media source type
       private func showAlert() {
    
            let alert = UIAlertController(title: "Image Selection", message: "From where you want to pick this image?", preferredStyle: .actionSheet)
                alert.addAction (UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
                   self.getImage(fromSourceType: .camera)
               }))
               alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {(action: UIAlertAction) in
                   self.getImage(fromSourceType: .photoLibrary)
               }))
               alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
               self.present(alert, animated: true, completion: nil)
        
       }
    //get image from source type
       private func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {

           //Check is source type available
           if UIImagePickerController.isSourceTypeAvailable(sourceType) {

               let imagePickerController = UIImagePickerController()
               imagePickerController.delegate = self
               imagePickerController.sourceType = sourceType
               imagePickerController.allowsEditing = true
               self.present(imagePickerController, animated: true, completion: nil)
           }
       }
    
    //MARK:- UIImagePickerViewDelegate.
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

           self.dismiss(animated: true) { [weak self] in

            guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
               //Setting image to your image view
            self?.photoImageView.image = image
           }
       }
    
    
   func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

//Mark Actions
    
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        self.showAlert()
        
        // Hide the keyboard.
         // nameTextField.resignFirstResponder()
        
          
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
       //  let imagePickerController = UIImagePickerController()
         
        
        // Only allow photos to be picked, not taken.
         //imagePickerController.sourceType = .photoLibrary
        
          
          // Make sure ViewController is notified when the user picks an image.
           //imagePickerController.delegate = self
           //present(imagePickerController, animated: true, completion: nil)
    }
   
    
  //  @IBAction func setDefaultLabelText(_ sender: Any) {
      //  mealNameLabel.text = "Default Text"
    //}
    


}
