//
//  CustomAuthPickerView.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-23.
//

import Foundation
import UIKit
import SnapKit

class CustomAuthPickerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(albumImageView)
        

        albumImageView.image = UIImage(named: "logo-big")
        albumImageView.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).offset(-100)
            make.height.equalTo(150)
            make.width.equalTo(150)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let albumImageView:UIImageView = {
        let drawableImageView = UIImageView()
        drawableImageView.image = UIImage(named: "logo-big")
        drawableImageView.contentMode = .scaleAspectFill
        return drawableImageView
    }()
    
    

    

    
}
