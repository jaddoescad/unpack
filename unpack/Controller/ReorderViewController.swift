//
//  PickerViewController.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-16.
//

import Foundation
import UIKit
import PhotosUI
import Floaty

class ReorderViewController: UICollectionViewController, PHPickerViewControllerDelegate {
    
    var images: [UIImage] = []

    @available(iOS 14, *)
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        var images_: [UIImage] = []

        dismiss(animated: true) {
            let group = DispatchGroup()
            
            guard !results.isEmpty else { return }
            
            for result in results {
                group.enter()
                result.itemProvider.loadObject(ofClass: UIImage.self) { (object, error) in
                    guard let image = object as? UIImage else { return }
                    images_.append(image)
                    group.leave()
                }
                
            }
            
            group.notify(queue: .main) {
                
                for i in 0 ..< images_.count {
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.1) {
                            self.images.append(images_[i])
                            self.collectionView?.insertItems(at: [IndexPath(item: self.images.count - 1, section: 0)])
                        }
                }
            }
                
        }
    }
    
    
    let floaty = Floaty()

    
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
        self.tabBarController?.tabBar.isHidden = true
        setFloatingActionButton()
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]

        self.title = "Hold to sort"


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
    
    @objc func addTapped (){
        
    }
}

