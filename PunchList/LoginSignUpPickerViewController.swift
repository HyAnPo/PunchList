//
//  LoginSignUpPickerViewController.swift
//  PunchList
//
//  Created by Andrew Porter on 12/2/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import UIKit

class LoginSignUpPickerViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var fieldsAreNotValid: Bool {
        
        if (emailTextField.text!.isEmpty ||
            passwordTextField.text!.isEmpty) {
                return true
        } else {
            return false
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        if fieldsAreNotValid {
            
            validationAlert("OOPS!", message: "Can't login without an email or password")
        } else {
        
            UserController.authenticateUser(emailTextField.text!, password: passwordTextField.text!) { (success, user) -> Void in
                
                if success {
                    
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    self.validationAlert("OOPS!", message: "There was an error when logging in, check your information and try again.")
                }
            }
        }
    }
    
    // Setup AlertController
    func validationAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                presentViewController(alert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
