//
//  Profile.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-25.
//

import Foundation
import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    @IBAction func logOut(_ sender: Any) {
        try! Auth.auth().signOut()
        if let storyboard = self.storyboard {
                    let vc = storyboard.instantiateViewController(withIdentifier: "firstNavigationController") as! UINavigationController
            vc.modalPresentationStyle = .fullScreen
            
            
            
                    self.present(vc, animated: true, completion: nil)
                }
    }
    
}
