//
//  ChoosePlatformViewController.swift
//  Homework26
//
//  Created by Kato on 5/21/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ChoosePlatformViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var androidImageView: UIImageView!
    
    @IBOutlet weak var appleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let androidTapped  = UITapGestureRecognizer(target: self, action: #selector(self.tapAndroid(_:)))
        androidTapped.delegate = self
        androidImageView.isUserInteractionEnabled = true
        androidImageView.addGestureRecognizer(androidTapped)
        
        let appleTapped  = UITapGestureRecognizer(target: self, action: #selector(self.tapApple(_:)))
        appleTapped.delegate = self
        appleImageView.isUserInteractionEnabled = true
        appleImageView.addGestureRecognizer(appleTapped)
        
    }
    
    @objc func tapAndroid(_ gestureRecognizer: UITapGestureRecognizer) {
        print("android tapped")
        
        NotificationCenter.default.post(name: .androidID, object: nil, userInfo: ["android_data_key" : "android data"])
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc func tapApple(_ gestureRecognizer: UITapGestureRecognizer) {
        print("apple tapped")
        
        NotificationCenter.default.post(name: .appleID, object: nil, userInfo: ["apple_data_key" : "apple data"])
        
        dismiss(animated: true, completion: nil)
        
    }
    
    deinit {
        print("deinit done")
        NotificationCenter.default.removeObserver(self)
    }

}
