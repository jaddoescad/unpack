//
//  helperfunctions.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-16.
//

import Foundation
import UIKit

//create function to work with hex
func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
    

}

func closeVC(navigationController: UINavigationController?){
    let transition:CATransition = CATransition()
transition.duration = 0.2
transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
transition.type = CATransitionType.reveal
transition.subtype = CATransitionSubtype.fromBottom
navigationController?.view.layer.add(transition, forKey: kCATransition)
navigationController?.popViewController(animated: false)
}


func openVC(navigationController: UINavigationController?, vc: UIViewController) {
    let transition = CATransition()
    transition.duration = 0.2
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    transition.type = CATransitionType.moveIn
    transition.subtype = CATransitionSubtype.fromTop
    navigationController?.view.layer.add(transition, forKey: nil)
    navigationController?.pushViewController(vc, animated: false)
}

//Setup a navigation bar
func setupNavigationBar(navigationController: UINavigationController?, lineColor: UIColor) {
    navigationController?.navigationBar.isTranslucent = false
    navigationController?.navigationBar.barTintColor = UIColor.white
    navigationController?.navigationBar.shadowImage = lineColor.as1ptImage()

}

//Create a basic error box
func basicAlert(title:String = "Error", message: String, controller: UIViewController){
    let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        switch action.style{
            case .default:
            print("default")
            
            case .cancel:
            print("cancel")
            
            case .destructive:
            print("destructive")
        }
    }))
    controller.present(alert, animated: true, completion: nil)
}

//check if a string has special characters
func checkForSpecialCharacters(word: String) -> Bool {
    let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
    if word.rangeOfCharacter(from: characterset.inverted) != nil {
        return true
    } else {
        return false
    }
}


func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}



