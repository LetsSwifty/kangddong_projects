//
//  ViewController.swift
//  Chapter02
//
//  Created by 강동영 on 2022/08/08.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton()
    }
    
    func addButton() {
        /*
         UIButton.ButtonType.system // 인터페이스 빌더를 통해 버튼을 추가했을 때의 기본 타입
         UIButton.ButtonType.custom // 기본 속성을 사용하지않고 원하는 형태로 직접 구현할 때 선택하는 타입
         UIButton.ButtonType.detailclosure // 타이틀 옆에 인포메이션 마크가 추가된다.
         UIButton.ButtonType.contactAdd // 타이틀 옆에 + 마크가 추가된다.
         */
        
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        btn.center = CGPoint(x: self.view.frame.size.width / 2, y: 100)
        btn.setTitle("TEST Button", for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    @objc func buttonAction() {
        print("TEST Button Action")
    }
    


}

