//
//  PickerView.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-16.
//

import UIKit
import PhotosUI


class ReorderViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var albumImage: UIImageView!
    
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
       super.awakeFromNib()
       //custom logic goes here
        albumImage.contentMode = .scaleAspectFill
        albumImage.clipsToBounds = true
        deleteButton.backgroundColor = UIColorFromRGB(rgbValue: 0xC74B4B)
        deleteButton.layer.cornerRadius = 15
    }
    
    
}

extension ReorderViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.title = "Hold to sort"

        switchNavItemtoNext(number: images.count)    }
    

}




// MARK: - Collection View Flow Layout Delegate
extension ReorderViewController: UICollectionViewDelegateFlowLayout {

  // 1
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    // 2
    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
    let availableWidth = view.frame.width - paddingSpace
    let widthPerItem = availableWidth / itemsPerRow

    return CGSize(width: widthPerItem, height: widthPerItem)
  }

  // 3
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int
  ) -> UIEdgeInsets {
    return sectionInsets
  }

  // 4
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    return sectionInsets.left
  }
}


extension ReorderViewController: UICollectionViewDragDelegate, UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        
        let item = self.images[indexPath.row]
        let provider = NSItemProvider(object: item as UIImage)
        let dragItem = UIDragItem(itemProvider: provider)
        dragItem.localObject = item
        return [dragItem]
    }

    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        var destinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let row = collectionView.numberOfItems(inSection: 0)
            destinationIndexPath = IndexPath(item: row - 1, section: 0)
        }
        
        if coordinator.proposal.operation == .move {
            reorderItems(coordinator: coordinator, destinationIndexPath: destinationIndexPath, collectionView: collectionView)
        }
    }
    
    fileprivate func reorderItems(coordinator:UICollectionViewDropCoordinator, destinationIndexPath:IndexPath, collectionView: UICollectionView) {
        if let item = coordinator.items.first, let sourceIndexPath = item.sourceIndexPath {
            collectionView.performBatchUpdates ({
                
                
                self.images.remove(at: sourceIndexPath.item)
                self.images.insert(item.dragItem.localObject as! UIImage, at: destinationIndexPath.item)
                collectionView.deleteItems(at: [sourceIndexPath])
                collectionView.insertItems(at: [destinationIndexPath])
            }, completion: nil)
            coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        if collectionView.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
    }
}

extension ReorderViewController {
    
    func setFloatingActionButton() {
        floaty.paddingY = 50
        floaty.buttonColor = .black
        floaty.hasShadow = false
        floaty.plusColor = .white

        floaty.addItem("Add more pictures", icon: UIImage(named: "cameraPlus")!, handler: { item in
            self.showDelete = false
            self.collectionView.reloadData()
            PHPhotoLibrary.requestAuthorization({
                (newStatus) in
                DispatchQueue.main.async {
                    
                    print("status is \(newStatus)")
                    if newStatus ==  PHAuthorizationStatus.authorized {
                        if #available(iOS 14, *) {
                            var configuration = PHPickerConfiguration()
                            configuration.selectionLimit = 100 - self.images.count
                            configuration.filter = .images
                            
                            
                            let picker = PHPickerViewController(configuration: configuration)
                            picker.delegate = self
                            
                            self.present(picker, animated: true, completion: nil)
                        } else {
                            // Fallback on earlier versions
                        }
                        print("success")
                    }
                }
            })
        })
        floaty.addItem("Delete Pictures", icon: UIImage(named: "bin")!, handler: { item in
            self.showDelete = true
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.cancel))
            self.collectionView.reloadData()
        })

        self.view.addSubview(floaty)
    }
    
    @objc func cancel() {
        self.showDelete = false
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(NextAddDetails))
        switchNavItemtoNext(number: images.count)
        self.collectionView.reloadData()
    }
}


