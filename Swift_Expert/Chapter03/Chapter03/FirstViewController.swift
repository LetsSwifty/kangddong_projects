//
//  FirstViewController.swift
//  Chapter03
//
//  Created by 강동영 on 2022/08/15.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 인라인(inline)방식 여러 줄의 코드를 한 줄로 줄여 작성하는 것
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        
        title.text = "FirstViewController".localized
        title.textColor = .red
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 14)
        
        /*
         center x 지정 전에 sizeToFit() 를 해야하는 이유
         UILabel이 동적인 사이즈를 가졌다면
         center 이후에 sizeTofit()를 하게되면 center의 위치가 부정확할 수 있다.
         
         */
        title.sizeToFit()
        title.center.x = self.view.frame.width / 2
        
        self.view.addSubview(title)
    }

}

