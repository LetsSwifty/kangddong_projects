//
//  ViewController.swift
//  Chapter03 UINavigationController
//
//  Created by 강동영 on 2022/08/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(frame: CGRect(x: 30, y: 200, width: 100, height: 20))
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(makeAlert), for: .touchUpInside)
        
        self.view.addSubview(btn)
        initTitleNew()
    }
    
    @objc func makeAlert() {
        
        let alert = UIAlertController(title: "로그인", message: "로그인 정보를 입력해주세요", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "아이디"
        }
        
        alert.addTextField { textField in
            textField.placeholder = "비밀번호"
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }

    func initTitleNew() {
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
        
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.textColor = .black
        topTitle.font = UIFont.systemFont(ofSize: 15)
        topTitle.text = "58개 숙소" //\n 1박(1월 10 ~ 1월 11일)
        
        let subTitle = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        subTitle.numberOfLines = 1
        subTitle.textAlignment = .center
        subTitle.textColor = .white
        subTitle.font = UIFont.systemFont(ofSize: 15)
        subTitle.text = "1박(1월 10 ~ 1월 11일)"
        
        containerView.addSubview(topTitle)
        containerView.addSubview(subTitle)
        
        self.navigationItem.titleView = containerView
        
        let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
        
        let back = UIImage(systemName: "arrow.backward")
        let leftItem = UIBarButtonItem(image: back,
                                       style: .plain,
                                       target: self,
                                       action: nil)
        
        self.navigationItem.leftBarButtonItem = leftItem
        
        let rv = UIView()
        rv.frame = CGRect(x: 0, y: 0, width: 70, height: 37)
        
        let rItem = UIBarButtonItem(customView: rv)
        self.navigationItem.rightBarButtonItem = rItem
        
        let cnt = UILabel()
        cnt.frame = CGRect(x: 10, y: 8, width: 20, height: 20)
        cnt.font = UIFont.boldSystemFont(ofSize: 10)
        cnt.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0)
        cnt.text = "12"
        cnt.textAlignment = .center
        
        cnt.layer.cornerRadius = 3
        cnt.layer.borderWidth = 2
        cnt.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        
        rv.addSubview(cnt)
        
        let more = UIButton(type: .system)
        more.frame = CGRect(x: 50, y: 10, width: 16, height: 16)
        more.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        
        rv.addSubview(more)
    }
}

