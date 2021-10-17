//
//  AlbumGridView.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-16.
//

import UIKit


class AlbumGridViewCell: UICollectionViewCell {
    
    @IBOutlet weak var albumImage: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
       super.awakeFromNib()
       //custom logic goes here
        albumImage.contentMode = .scaleAspectFill
        albumImage.clipsToBounds = true

    }
    
}

extension AlbumGridViewController {
    override func viewDidLayoutSubviews() {
        self.view.backgroundColor = .red
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
    }
}
