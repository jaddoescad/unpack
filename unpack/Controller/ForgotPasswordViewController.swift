//
//  ForgotPasswordViewController.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-26.
//

import Foundation
import UIKit
import FirebaseAuth

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
    }
    
    @IBAction func resetPasswordAction(_ sender: Any) {
        guard let email = emailTextField.text else {
            return
        }
        Auth.auth().sendPasswordReset(withEmail: email ) { error in
            // Your code here
            if (error != nil) {
                basicAlert(message: "There was an error trying to send you an email reset link", controller: self)
                
            } else {
                basicAlert(title: "INFO", message: "Please check you email inbox to reset password", controller: self)

            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //do not allow white spaces to be written
        if string == " " {
                   return false
               }
               return true
    }

    
}
