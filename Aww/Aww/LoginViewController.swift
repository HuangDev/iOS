//
//  LoginViewController.swift
//  Aww
//
//  Created by XilongHuang on 27/10/2016.
//  Copyright © 2016 SeanDev. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate{
	
	
	@IBOutlet weak var inputUsername: UITextField!
	@IBOutlet weak var inputPassword: UITextField!
	

    override func viewDidLoad() {
        super.viewDidLoad()
		inputUsername.delegate = self
		inputPassword.delegate = self
    }
	

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	//MARK: UITextFieldDelegate
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
	func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
		checkValidUsername()
		navigationItem.title = textField.text
		return true
	}
	
	func checkValidUsername(){
	
	}
	
	
	@IBAction func onLogin(_ sender: UIButton) {
		
		
	}
	

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
