//
//  MemoFormVC.swift
//  Chapter01
//
//  Created by 강동영 on 2022/08/03.
//

import UIKit

class MemoFormVC: UIViewController {

    @IBOutlet weak var conetentsTextView: UITextView!
    @IBOutlet weak var previewImageView: UIImageView!
    
    var subject: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: UIBarButtonItem!) {
        
    }
    
    @IBAction func pick(_ sender: UIBarButtonItem!) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        self.present(picker, animated: false, completion: nil)
    }
}

extension MemoFormVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}
