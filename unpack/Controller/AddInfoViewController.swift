//
//  AddInfo.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-19.
//

import Foundation
import UIKit


class AddInfoViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var placeholderLabel: UILabel!
    
    @IBOutlet weak var albumTitleTextField: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isTranslucent = true

    }
    
    override func viewDidLoad() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .done, target: self, action: #selector(PostAlbum))
        self.view.backgroundColor = .white
        albumTitleTextField.backgroundColor = .white
        albumTitleTextField.delegate = self

        albumTitleTextField.textContainerInset = UIEdgeInsets(top: 20, left: 15, bottom: 0, right: 0)

        placeholderLabel.isHidden = !albumTitleTextField.text.isEmpty

        placeholderLabel.text = "Enter title..."
        placeholderLabel.font = UIFont(name: "PTSerif-Bold", size: 15)
        
        albumTitleTextField.font = UIFont(name: "PTSerif-Bold", size: 15)
        
        albumTitleTextField.textColor = .black
        placeholderLabel.sizeToFit()
        albumTitleTextField.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (albumTitleTextField.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !albumTitleTextField.text.isEmpty
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    
    @objc func PostAlbum() {
        
    }
}
