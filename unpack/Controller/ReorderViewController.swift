//
//  PickerViewController.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-16.
//

import Foundation
import UIKit
import PhotosUI

class ReorderViewController: UICollectionViewController {
    
    var images: [UIImage] = []
    let itemsPerRow: CGFloat = 2
    
    let sectionInsets = UIEdgeInsets(
        top: 0.0,
      left: 0,
        bottom: 0,
      right: 0)
    
    override func viewDidLoad() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.dragDelegate = self
        collectionView.dropDelegate = self
        collectionView.dragInteractionEnabled = true
    }
    
    @objc func close() {
        closeVC(navigationController: self.navigationController)
    }
}


// MARK: - UICollectionViewDataSource
extension ReorderViewController {
  // 1
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  // 2
  override func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return images.count
  }
  
  // 3
  override func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: "collectionCell",
      for: indexPath) as! ReorderViewCell
      
      
            
    cell.albumImage.image = images[indexPath.row]
    cell.backgroundColor = .black

      
    // Configure the cell
    return cell
  }
}

