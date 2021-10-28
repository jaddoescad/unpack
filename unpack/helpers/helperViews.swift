//
//  helperViews.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-16.
//
import UIKit

class roundImageView: UIImageView {

    override init(frame: CGRect) {
        // 1. setup any properties here
        // 2. call super.init(frame:)
        super.init(frame: frame)
        // 3. Setup view from .xib file
    }

    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        // 3. Setup view from .xib file
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
}


func setImageURL(urlString: String) ->  UIImage? {
    
    let url  = URL(string: urlString)
    if let url = url {
        let data = try? Data(contentsOf: url)
        if let imageData = data {
            let image = UIImage(data: imageData)
            return image
        } else {
            return nil
        }
    } else {
        return nil
    }


}


class ButtonWithImage: UIButton {
    
    func addRightBorder(borderColor: UIColor, borderWidth: CGFloat) {
       let border = CALayer()
       border.backgroundColor = borderColor.cgColor
       border.frame = CGRect(x: 0,y: self.frame.size.height - borderWidth, width:self.frame.size.width, height:borderWidth )
       self.layer.addSublayer(border)
    }

    func addLeftBorder(color: UIColor, width: CGFloat) {
       let border = CALayer()
       border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0, y:0, width:self.frame.size.width, height:1)
       self.layer.addSublayer(border)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 10, left: (bounds.width - 35), bottom: 5, right: 5)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
            
            self.addRightBorder(borderColor: .lightGray, borderWidth: 1)
            self.addLeftBorder(color: .lightGray, width: 1)

            
            
            
            
        }
    }
}




class ButtonWithImageAuth: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 10, left: 5, bottom: 5, right: (bounds.width - 35))
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)

            

        }
    }
}
