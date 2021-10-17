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
