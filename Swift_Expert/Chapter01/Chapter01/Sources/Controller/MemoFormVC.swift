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

        conetentsTextView.delegate = self
    }
    
    @IBAction func save(_ sender: UIBarButtonItem!) {
        
        guard self.conetentsTextView.text.isEmpty == false else {
            
            let alert = UIAlertController(title: nil,
                                          message: "내용을 입력해주세요",
                                          preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true)
            return
        }
        
        let data = MemoData()
        
        data.title = self.subject
        data.contents = self.conetentsTextView.text
        data.image = self.previewImageView.image
        data.regdate = Date()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memoList.append(data)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pick(_ sender: UIBarButtonItem!) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        self.present(picker, animated: false, completion: nil)
    }
}

extension MemoFormVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.editedImage] as? UIImage {
            self.previewImageView.image = image
        } else if let image = info[.originalImage] as? UIImage {
            self.previewImageView.image = image
        }
        
        picker.dismiss(animated: true)
    }

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
}

extension MemoFormVC: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        let contents =  textView.text as NSString
        let length = ((contents.length > 15) ? 15 : contents.length)
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        
        self.navigationItem.title = self.subject
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
    }
    
}
