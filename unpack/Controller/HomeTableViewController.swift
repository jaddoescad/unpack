//
//  ViewController.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-14.
//

import UIKit
import PhotosUI
import Kingfisher

class HomeTableViewController: UITableViewController, PHPickerViewControllerDelegate
{
    
    private let album = AlbumAPI.getAlbums() // model
    var rowHeights:[Int:CGFloat] = [:]
    var picking: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        self.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "albumCell")
        setupNavigationBar(navigationController: self.navigationController, lineColor: .lightGray)

    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension

    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @objc func addTapped() {
        PHPhotoLibrary.requestAuthorization({
            (newStatus) in
            DispatchQueue.main.async {
                
                print("status is \(newStatus)")
                if newStatus ==  PHAuthorizationStatus.authorized {
                    if #available(iOS 14, *) {
                        var configuration = PHPickerConfiguration()
                        configuration.selectionLimit = 100
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
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let height = self.rowHeights[indexPath.row]{
            return height
        }else{
            return 250
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath as IndexPath) as! HomeTableViewCell
        cell.album = album[indexPath.row]
        DispatchQueue.main.async {
            tableView.beginUpdates()
            self.rowHeights[indexPath.row] = cell.albumImageView.frame.height+cell.profileImageView.frame.height + 50
            tableView.endUpdates()
        }
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(goToAlbum))
        cell.albumImageView.isUserInteractionEnabled = true
        cell.albumImageView.addGestureRecognizer(singleTap)
        return cell
    }
    
    @objc func goToAlbum(){
        // all data available, continue
    let AlbumGridViewController = self.storyboard?.instantiateViewController(withIdentifier: "AlbumGridViewController") as! AlbumGridViewController
        
    self.navigationController?.pushViewController(AlbumGridViewController, animated: true)
    }
    
    @available(iOS 14, *)
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        if picking == true {
            return
        }
        picking = true
        
        dismiss(animated: true) {
            let group = DispatchGroup()
            
            guard !results.isEmpty else { return }
            var images: [UIImage] = []
            
            for result in results {
                group.enter()
                result.itemProvider.loadObject(ofClass: UIImage.self) { (object, error) in
                    guard let image = object as? UIImage else { return }
                    group.leave()

                    images.append(image)
                    
                }
                
            }
            
            group.notify(queue: .main) {
                    // all data available, continue
                let ReorderViewController = self.storyboard?.instantiateViewController(withIdentifier: "ReorderViewController") as! ReorderViewController
                
                ReorderViewController.images = images;
                
                self.navigationController?.pushViewController(ReorderViewController, animated: true)
                self.picking = false
            }
            
            

            
            
        }
    }
    
}
