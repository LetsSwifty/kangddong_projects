//
//  ImageCell.swift
//  colltest
//
//  Created by dongyeongkang on 2022/07/27.
//

import UIKit

class ImageCell: UICollectionViewCell {
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var deleteButton: UIButton!
    
    var index: Int?
    var deleteAction: ((_ index: Int)->())?
    
    override func awakeFromNib() {
        initImageview()
        
    }
    override func layoutSubviews() {
        //initImageview()
    }
    
    //이미지 뷰
    private func initImageview() {
        imageview.contentMode = .scaleAspectFill
        imageview.backgroundColor = UIColor.lightGray
        imageview.layer.cornerRadius = 10
        imageview.layer.borderWidth = 3.0
        imageview.layer.borderColor = UIColor.gray.cgColor
        imageview.layer.masksToBounds = true
        imageview.clipsToBounds = true
    }
    
    func configImageView(image: UIImage, hidden: Bool, index: Int) {
        self.index = index
        self.imageview.image = image
        self.deleteButton.isHidden = hidden
        self.deleteButton.addTarget(self, action: #selector(deleteImage), for: .touchUpInside)
    }
    
    func configAddView(image: UIImage, hidden: Bool) {
        
        self.imageview.image = image
        self.deleteButton.isHidden = hidden
        self.imageview.layer.borderWidth = 5.0
        self.imageview.layer.borderColor = UIColor.red.cgColor
    }
    
    @objc func deleteImage() {
        guard let index = self.index else { return }
        
        self.deleteAction?(index)
    }
}
