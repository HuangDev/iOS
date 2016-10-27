//
//  ViewController.swift
//  HelloWorld
//
//  Created by XilongHuang on 26/10/2016.
//  Copyright © 2016 SeanDev. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var inputName: UITextField!
    
	@IBOutlet weak var photoImageView: UIImageView!
	
	@IBOutlet weak var ratingControl: RatingControl!
	
	@IBOutlet weak var saveButton: UIBarButtonItem!
	
	var meal : Meal?
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputName.delegate = self
		// Set up views if editing an existing Meal.
		if let meal = meal {
			navigationItem.title = meal.name
			inputName.text   = meal.name
			photoImageView.image = meal.photo
			ratingControl.rating = meal.rating
		}
		checkValidMealName()
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        checkValidMealName()
		navigationItem.title = textField.text
        return true
    }
	
	@IBAction func cancel(_ sender: UIBarButtonItem) {
		let isPresentingInAddMealMode = presentingViewController is UINavigationController
		if isPresentingInAddMealMode {
			dismiss(animated: true, completion: nil)
		}
		else{
			navigationController!.popViewController(animated: true)
		}
		
	}
	
	@IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
		inputName.resignFirstResponder()
		let imagePicker = UIImagePickerController()
		imagePicker.sourceType = .photoLibrary
		imagePicker.delegate = self
		present(imagePicker, animated: true, completion: nil)
	}

	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
	
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
		let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
		photoImageView.image = selectedImage
		dismiss(animated: true, completion: nil)
	}
	

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if  let senderButton =  sender as? UIBarButtonItem , senderButton == saveButton {
			let name = inputName.text ?? ""
			let photo = photoImageView.image
			let rating = ratingControl.rating
			meal = Meal(name: name, photo: photo, rating: rating)
		}
	}
	
	func checkValidMealName() {
		// Disable the Save button if the text field is empty.
		let text = inputName.text ?? ""
		saveButton.isEnabled = !text.isEmpty
	}
	
	
	

}

