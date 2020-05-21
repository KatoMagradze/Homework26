//
//  ViewController.swift
//  Homework26
//
//  Created by Kato on 5/21/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chooseButton: UIButton!
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        chooseButton.layer.cornerRadius = chooseButton.frame.size.height/2
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didReceiveAndroidInformation(with:)),
            name: .androidID,
            object: nil)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didReceiveAppleInformation(with:)),
            name: .appleID,
            object: nil)
            
    }
    
    @objc func didReceiveAndroidInformation(with notification: Notification) {
        print("android info received")
        
        if let userInfo = notification.userInfo {
            print(userInfo["android_data_key"])
            mainLabel.text = "nobody is perfect"
            mainImageView.image = UIImage(named: "android_image")
        }
    }
    
    @objc func didReceiveAppleInformation(with notification: Notification) {
        print("apple info received")
        
        if let userInfo = notification.userInfo {
            print(userInfo["apple_data_key"])
            mainLabel.text = "better choice :)"
            mainImageView.image = UIImage(named: "apple")
        }
    }
    
    
    @IBAction func onChooseTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let temp = storyboard.instantiateViewController(withIdentifier: "platforms_vc")
        
        present(temp, animated: true, completion: nil)
        
    }
    
}

extension NSNotification.Name {
    static let androidID = NSNotification.Name("android_channel_id")
    static let appleID = NSNotification.Name("apple_channel_id")
}

