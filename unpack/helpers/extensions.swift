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



