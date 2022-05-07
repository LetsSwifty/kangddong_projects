//
//  BookmarkTableViewCell.swift
//  BookManager
//
//  Created by 강동영 on 2022/05/07.
//

import UIKit

class BookmarkTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var bookMarkButton: UIButton!

    var row: Int?
    var delegate: ToggleBookMark?
    var isOn = true
    
    @IBAction func setBookMark(_ sender: UIButton) {
        
        if isOn {
            bookMarkButton.setImage(UIImage(named: "book"), for: .normal)
            isOn = false
        } else {
            bookMarkButton.setImage(UIImage(named: "book.fill"), for: .normal)
            isOn = true
        }
        delegate?.toggle(row: row, isOn: isOn)
        
        print("page2 button")
    }
}
