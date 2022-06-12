//
//  BookTableViewCell.swift
//  BookManager
//
//  Created by 강동영 on 2022/05/04.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var bookMarkButton: UIButton!
    
    var row: Int?
    var delegate: ToggleBookMark?    
    
    //TODO: 북마크 버튼 눌렀을 때
    @IBAction func setBookMark(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        delegate?.toggle(row: row, isOn: sender.isSelected)
    }

}
