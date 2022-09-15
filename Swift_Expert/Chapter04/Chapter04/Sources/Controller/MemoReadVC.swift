//
//  MemoReadVC.swift
//  Chapter01
//
//  Created by 강동영 on 2022/08/03.
//

import UIKit

class MemoReadVC: UIViewController {

    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var param: MemoData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI(param: param)
    }
    
    
    private func setUI(param: MemoData?) {
        guard let param = param else { return }

        self.subject.text = param.title
        self.contents.text = param.contents
        self.imageView.image = param.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성됨"
        
        var dateString: String? = nil
        if let registDate = param.regdate {
            dateString = formatter.string(from: registDate)
        }
        
        
        self.navigationItem.title = dateString
    }

}
