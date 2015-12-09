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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        UserController.authenticateUser(emailTextField.text!, password: passwordTextField.text!) { (success, user) -> Void in
            
            if success {
                
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                self.validationAlert()
            }
        }
    }
    
    // Setup AlertController
    func validationAlert() {
        
        let alert = UIAlertController(title: "Error", message: "Your account can't be created, check your information and try again.", preferredStyle: .Alert)
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
