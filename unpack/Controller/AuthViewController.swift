//
//  authPage.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-22.
//

import Foundation
import UIKit
import FirebaseAuth


class AuthViewController: UIViewController {
    
    @IBOutlet weak var privacyTermsTextView: UITextView!
    @IBOutlet weak var LoginDisclaimerTextView: UITextView!
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        print(Auth.auth().currentUser)

        
        setupNavigationBar(navigationController: self.navigationController, lineColor: .white)


        SetDisclaimersStyles(authTextView: privacyTermsTextView)
        LoginDisclaimerTextView.backgroundColor = .white
        LoginDisclaimerTextView.textColor = .black
 
    }
    
    
    func SetDisclaimersStyles(authTextView: UITextView) {
        
        let attributedString = NSMutableAttributedString(string: "By signing up, you agree to our Terms, Privacy Policy.")
        let url = URL(string: "https://www.apple.com")!
        let url2 = URL(string: "https://www.apple.com")!
        let url3 = URL(string: "https://www.apple.com")!
        let url4 = URL(string: "https://www.apple.com")!


        // Set the 'click here' substring to be the link
        attributedString.setAttributes([.link: url], range: NSMakeRange(32, 5))
        
        attributedString.setAttributes([.link: url2], range: NSMakeRange(39, 7))
        
        authTextView.attributedText = attributedString
        authTextView.isUserInteractionEnabled = true
        authTextView.isEditable = false
        authTextView.backgroundColor = .white
        authTextView.textAlignment = .center

        // Set how links should appear: blue and underlined
        authTextView.linkTextAttributes = [
            .foregroundColor: UIColor.blue,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
    }
    
    @IBAction func EmailAction(_ sender: Any) {
        let SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
    
        self.navigationController?.pushViewController(SignUpViewController, animated: true)

    }
    
    @IBAction func LoginAction(_ sender: Any) {
        let LoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
    
        self.navigationController?.pushViewController(LoginViewController, animated: true)
    }
    
    
    
    
}
