//
//  helperfunctions.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-16.
//

import Foundation
import UIKit

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
