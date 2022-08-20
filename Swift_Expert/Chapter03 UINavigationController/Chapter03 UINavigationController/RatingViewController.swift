//
//  RatingViewController.swift
//  Chapter03 UINavigationController
//
//  Created by 강동영 on 2022/08/21.
//

import UIKit
import FloatRatingView

class RatingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let ratingView = FloatRatingView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.view = ratingView
        self.preferredContentSize.width = 200
        self.preferredContentSize.height = 30
        
        ratingView.minRating = 1
        ratingView.maxRating = 5
        ratingView.rating = 3.5
        ratingView.emptyImage = UIImage(named: "StarEmpty")
        ratingView.fullImage = UIImage(named: "StarFull")
        //ratingView.delegate = self
    }
}

extension RatingViewController: FloatRatingViewDelegate {
    
    @objc func floatRatingView(_ ratingView: FloatRatingView, didUpdate rating: Double) {
        
    }

    /// Returns the rating value as the user pans
    @objc  func floatRatingView(_ ratingView: FloatRatingView, isUpdating rating: Double) {
        
    }
}
