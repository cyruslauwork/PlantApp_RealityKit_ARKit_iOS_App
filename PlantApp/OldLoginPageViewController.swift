//
//  LoginPageViewController.swift
//  PlantApp
//
//  Created by Leung Yuet Yi on 17/7/2021.
//

import UIKit

class OldLoginPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func FacebookBtn_URL(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://zh-hk.facebook.com")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func Btn_InstagramURL(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://www.instagram.com")! as URL, options: [:], completionHandler: nil)
    }
    

}
