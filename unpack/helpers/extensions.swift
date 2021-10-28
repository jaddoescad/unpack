//
//  extensions.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-16.
//


import UIKit

extension UIImageView {

   func setRounded() {
       let radius = self.frame.width/2.0
       self.layer.cornerRadius = radius
       self.layer.masksToBounds = true

   }
}



extension UIColor {
    func as1ptImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        let ctx = UIGraphicsGetCurrentContext()
        self.setFill()
        ctx!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
