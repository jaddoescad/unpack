

import Foundation
import UIKit
import PhotosUI

class AlbumGridViewController: UICollectionViewController {

    
    
    var images = AlbumPicturesAPI.getAlbums()
    
    private let itemsPerRow: CGFloat = 2
    
    private let sectionInsets = UIEdgeInsets(
        top: 0.0,
      left: 0,
        bottom: 0,
      right: 0)
    
    override func viewDidLoad() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
    }
    
    @objc func close() {
        closeVC(navigationController: self.navigationController)
    }
}


// MARK: - UICollectionViewDataSource
extension AlbumGridViewController {
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
      withReuseIdentifier: "albumGridCell",
      for: indexPath) as! AlbumGridViewCell
      
      
            
//      cell.albumImage.image
      
      if let imageURL = images[indexPath.row].albumPictureUrl {
          cell.albumImage.kf.setImage(with: URL(string: imageURL))
      }
        
    cell.backgroundColor = .black

      
    // Configure the cell
    return cell
  }
}

// MARK: - Collection View Flow Layout Delegate
extension AlbumGridViewController: UICollectionViewDelegateFlowLayout {



  // 1
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
      let width = view.frame.size.width * 0.5
      // in case you you want the cell to be 40% of your controllers view
      return CGSize(width: width , height: width )
    // 2
//    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//    let availableWidth = view.frame.width - paddingSpace
//    let widthPerItem = availableWidth / itemsPerRow
//
//    return CGSize(width: widthPerItem, height: widthPerItem)
  }

  // 3
//  func collectionView(
//    _ collectionView: UICollectionView,
//    layout collectionViewLayout: UICollectionViewLayout,
//    insetForSectionAt section: Int
//  ) -> UIEdgeInsets {
//    return sectionInsets
//  }

  // 4
//  func collectionView(
//    _ collectionView: UICollectionView,
//    layout collectionViewLayout: UICollectionViewLayout,
//    minimumLineSpacingForSectionAt section: Int
//  ) -> CGFloat {
//    return sectionInsets.left
//  }
}
