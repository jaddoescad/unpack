//
//  SignUpViewController.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-23.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signUpNextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        passwordField.isSecureTextEntry = true
                                                            
        signUpNextButton.isEnabled = false
        self.view.backgroundColor = .white
    }
    
    
    @IBAction func signUpAction(_ sender: Any) {
        //make sure username, email and password isn't empty, this is extra and should never get triggered as button should be disabled when these things are empty
        guard let username = usernameField.text, !username.isEmpty, let email = emailField.text, !email.isEmpty, let password = passwordField.text, !password.isEmpty else {
            return
        }
        
        //throw error if username has special characters
        if (checkForSpecialCharacters(word: username) == true) {
            basicAlert(message:"Please do not use special characters in username, only words and numbers", controller: self)
            return
        }
        //check if email is valid
        //throw error if email does not conform to email
        if (isValidEmail(email) == false) {
            basicAlert(message:"Please use a valid email", controller: self)
            return
        }
        //check if password has at least 6 characters
        //throw error if password isn't secure enough
        if (password.count < 6) {
            basicAlert(message:"Please enter a valid password with at least 6 characters", controller: self)
            return
        }
        

        
        
        //authenticate with firebase
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            // Add a new document in collection "users"
            let db = Firestore.firestore()
            var ref: DocumentReference? = nil

            // Add a second document with a generated ID.
            ref = db.collection("users").addDocument(data: [
                "username": username,
                "email": email,
            ]) { err in
                if let err = err {
                    basicAlert(message:"There was an error trying to sign you up.", controller: self)
                    if FirestoreErrorCode(rawValue: err._code) != nil {
                        let user = Auth.auth().currentUser
                        user?.delete { error in
                          if let error = error {
                              print(error)
                              // log this error in firebase
                          }
                        }
                    }
                } else {
                    //go to Home
                    print("Document added with ID: \(ref!.documentID)")
                    let MainTabBar = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBar") as! UITabBarController
                    MainTabBar.modalPresentationStyle = .fullScreen
                    self.present(MainTabBar, animated: true, completion: nil)
                }
            }

        }
        
        

        
    }

    
    //check if any textfield is changing
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.checkField(sender: textField)
    }
    

    
    //check to enable or disable button if any fields are empty
    func checkField(sender: AnyObject) {
        guard let username = usernameField.text, !username.isEmpty, let email = emailField.text, !email.isEmpty, let password = passwordField.text, !password.isEmpty else {
            signUpNextButton.isEnabled = false
            return
        }
        signUpNextButton.isEnabled = true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //do not allow white spaces to be written
        if string == " " {
                   return false
               }
               return true
    }
    
}
