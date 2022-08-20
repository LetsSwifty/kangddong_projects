//
//  CSButton.swift
//  Chapter03 UINavigationController
//
//  Created by 강동영 on 2022/08/21.
//

import UIKit

class CSButton: UIButton {

    public enum CSButtonType {
        
        case rect
        case circle
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commInit()
    }
    
    convenience init(type: CSButtonType) {
        self.init()
        
        switch type {
        case .rect:
            self.backgroundColor = .black
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 0
            self.setTitleColor(.black, for: .normal)
            self.setTitle("Rect Button", for: .normal)
            
        case .circle:
            self.backgroundColor = .red
            self.layer.borderColor = UIColor.blue.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = self.frame.height / 2
            self.setTitleColor(.black, for: .normal)
            self.setTitle("Circle Button", for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commInit()
    }

    func commInit() {
        
        self.backgroundColor = .green
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("커스텀 버튼", for: .normal)
    }
}
