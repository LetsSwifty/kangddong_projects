//
//  CustomAlertVC.swift
//  Chapter03 UINavigationController
//
//  Created by 강동영 on 2022/08/21.
//

import UIKit
import MapKit
import FloatRatingView

class CustomAlertVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initMapBtn()
        initRatingBtn()
    }
    
    func initMapBtn() {
        //let alertBtn = UIButton(type: .system)
        let alertBtn = CSButton(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        //alertBtn.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        alertBtn.center.x = self.view.frame.width / 2
        alertBtn.setTitle("기본 알림창", for: .normal)
        //alertBtn.backgroundColor = .red
        alertBtn.addTarget(self, action: #selector(makeMapAlert), for: .touchUpInside)
        
        self.view.addSubview(alertBtn)
    }
    
    @objc func makeMapAlert() {
        
        let alert = UIAlertController(title: nil, message: "여기가 맞습니까?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        let contentVC = MapKitViewController()
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func initRatingBtn() {
        let alertBtn = UIButton(type: .system)
        alertBtn.frame = CGRect(x: 0, y: 200, width: 100, height: 30)
        alertBtn.center.x = self.view.frame.width / 2
        alertBtn.setTitle("별점 알림창", for: .normal)
        alertBtn.backgroundColor = .red
        alertBtn.addTarget(self, action: #selector(makeRatingAlert), for: .touchUpInside)
        
        self.view.addSubview(alertBtn)
    }
    
    @objc func makeRatingAlert() {
        
        let alert = UIAlertController(title: nil, message: "별점 주세용", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        let contentVC = RatingViewController()
        contentVC.ratingView.delegate = self
        // key contentViewController 이외에는 exception Private API라서 !
        alert.setValue(contentVC, forKey: "contentViewController")
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func initDefaultBtn() {
        let defaultAlertBtn = UIButton(type: .system)
        defaultAlertBtn.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        defaultAlertBtn.center.x = self.view.frame.width / 2
        defaultAlertBtn.setTitle("기본 알림창", for: .normal)
        defaultAlertBtn.backgroundColor = .red
        defaultAlertBtn.addTarget(self, action: #selector(makeAlert), for: .touchUpInside)
        
        self.view.addSubview(defaultAlertBtn)
    }
    
    @objc func makeAlert() {
        
        let alert = UIAlertController(title: "알림창", message: "기본 메시지가 들어가는 곳", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        let v = UIViewController()
        v.view.backgroundColor = .blue
        alert.setValue(v, forKey: "contentViewController")
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension CustomAlertVC: FloatRatingViewDelegate {
    
    @objc func floatRatingView(_ ratingView: FloatRatingView, didUpdate rating: Double) {
        
        print(">>>>>>>didUpdate \(rating)")
        
    }

    /// Returns the rating value as the user pans
    @objc  func floatRatingView(_ ratingView: FloatRatingView, isUpdating rating: Double) {
        
    }
}
