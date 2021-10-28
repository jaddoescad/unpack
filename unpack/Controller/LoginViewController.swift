//
//  SignUpViewController.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-23.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var ForgotPasswordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        passwordTextField.isSecureTextEntry = true
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
            return
        }
        
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            let MainTabBar = strongSelf.storyboard?.instantiateViewController(withIdentifier: "MainTabBar") as! UITabBarController
            MainTabBar.modalPresentationStyle = .fullScreen
            strongSelf.present(MainTabBar, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func ForgotPasswordAction(_ sender: Any) {
        let ForgotPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        self.navigationController?.pushViewController(ForgotPasswordViewController, animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //do not allow white spaces to be written
        if string == " " {
                   return false
               }
               return true
    }
    
}
