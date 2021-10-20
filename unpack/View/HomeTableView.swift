//
//  HomeView.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-15.
//

import UIKit
import Foundation
import SnapKit
import Kingfisher


class HomeTableViewCell: UITableViewCell {
    
    
    var album:Album? {
        didSet {
            guard let album = album else {return}
            
            if let url = album.profileImageUrl {
                profileImageView.kf.setImage(with: URL(string: url))
            }
            
            if let profileName = album.profileName {
                profileNameLabel.text = profileName
            }
            
            if let albumImageUrl = album.albumImage {
                albumImageView.kf.setImage(with: URL(string: albumImageUrl))
            }
     
            if let albumTitleText = album.albumTitle {
                albumTitle.text = albumTitleText
            }
            
            
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(albumImageView)
        self.contentView.addSubview(profileNameLabel)
        self.contentView.addSubview(profileImageView)
        albumImageView.addSubview(overlay)
        albumImageView.addSubview(albumTitle)
        
        profileImageView.snp.makeConstraints{(make) -> Void in
            
            make.width.height.equalTo(30)
            make.left.top.equalTo(self.contentView).inset(10)
        }
        
        profileNameLabel.snp.makeConstraints{(make) -> Void in
            make.left.equalTo(profileImageView.snp.right).inset(-5)
            make.centerY.equalTo(profileImageView.snp.centerY)
        }
        
        albumImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).inset(20)
            make.right.equalTo(contentView.snp.right).inset(20)
            
            make.top.equalTo(profileImageView.snp.bottom).inset(-15)
            make.height.equalTo(albumImageView.snp.width).dividedBy(1.8)
        }
        
        overlay.snp.makeConstraints { make in
            make.left.equalTo(albumImageView.snp.left)
            make.right.equalTo(albumImageView.snp.right)
            make.top.equalTo(albumImageView.snp.top)
            make.bottom.equalTo(albumImageView.snp.bottom)
        }
        
        albumTitle.snp.makeConstraints { make in
            make.centerX.equalTo(albumImageView.snp.centerX)
            make.bottom.equalTo(albumImageView.snp.bottom).inset(15)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    let profileImageView:UIImageView = {
        let img = roundImageView(frame:CGRect(x: 0, y: 0, width: 0, height: 0))
        img.contentMode = .scaleAspectFill // without this your image will shrink and looks ugly
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        return img
        
        
    }()
    
    let profileNameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor =  .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let albumImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // without this your image will shrink and looks ugly
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 30
        img.clipsToBounds = true
        return img
    }()
    
    let overlay: UIView = {
        let overlay = UIView()
        overlay.backgroundColor = UIColorFromRGB(rgbValue: 0x04372E).withAlphaComponent(0.37)
        
        return overlay
    }()
    
    let albumTitle: UILabel = {
        let albumTitle = UILabel()
        albumTitle.textColor = .white
        albumTitle.font = UIFont(name: "PTSerif-Bold", size: 24)
        return albumTitle
    }()
    
    
}

extension HomeTableViewController {
    override func viewWillLayoutSubviews() {
        self.view.backgroundColor = .white
//        navigationController?.navigationBar.barTintColor = UIColor.white

        setupNavigationBar()
//        changeStatusBarColor()
    }
    
    

    
    func setupNavigationBar() {
        //change title image
        setUpNavigationBarTitleImage()
        //  change color of navigation bar
        changeNavigationBarColor()
        // add navigation bar Item
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        add.tintColor = .black
        navigationItem.rightBarButtonItems = [add]
    }
    
    
    func changeNavigationBarColor() {
        self.navigationController?.navigationBar.isTranslucent = true
                navigationController?.navigationBar.barTintColor = UIColor.white
//        self.navigationController?.navigationBar.backgroundColor = UIColor.white
    }
    
    func setUpNavigationBarTitleImage() {
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 35))
        let titleImageView = UIImageView(image: UIImage(named: "logo-horizontal.png"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: titleView.frame.width, height: titleView.frame.height)
        titleImageView.contentMode = .scaleAspectFit
        
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
    
    func changeStatusBarColor() {
        if #available(iOS 13.0, *) {
            let statusBar1 =  UIView()
            statusBar1.frame = UIApplication.shared.keyWindow?.windowScene?.statusBarManager!.statusBarFrame as! CGRect
            statusBar1.backgroundColor = UIColor.white
            
            UIApplication.shared.keyWindow?.addSubview(statusBar1)
            
        } else {
            
            let statusBar1: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
            statusBar1.backgroundColor = UIColor.white
        }
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
