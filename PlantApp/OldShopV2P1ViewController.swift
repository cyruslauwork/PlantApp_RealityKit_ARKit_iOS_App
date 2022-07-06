//
//  ShopV2P1ViewController.swift
//  PlantApp
//
//  Created by Lau Wing Yin on 17/7/2021.
//
//
//  ViewController.swift
//  BoguShop
//
//  Created by Jason Hsu on 2018/7/20.
//  Copyright © 2018 junchoon. All rights reserved.
//

import UIKit

class OldShopV2P1ViewController: UIViewController {
    
    @IBOutlet weak var qtyLabel_1: UILabel!
    @IBOutlet weak var qtyLabel_2: UILabel!
    @IBOutlet weak var qtyLabel_3: UILabel!
    @IBOutlet weak var qtyLabel_4: UILabel!
    @IBOutlet weak var qtyLabel_5: UILabel!
    @IBOutlet weak var qtyLabel_6: UILabel!
    @IBOutlet weak var costLabel_1: UILabel!
    @IBOutlet weak var costLabel_2: UILabel!
    @IBOutlet weak var costLabel_3: UILabel!
    @IBOutlet weak var costLabel_4: UILabel!
    @IBOutlet weak var costLabel_5: UILabel!
    @IBOutlet weak var costLabel_6: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    
    
    var qtyValue_1: Int = 0
    var qtyValue_2: Int = 0
    var qtyValue_3: Int = 0
    var qtyValue_4: Int = 0
    var qtyValue_5: Int = 0
    var qtyValue_6: Int = 0
    
    var cost_1 = 1000
    var cost_2 = 3000
    var cost_3 = 1600
    var cost_4 = 3000
    var cost_5 = 5500
    var cost_6 = 8000
    
    
    
    @IBAction func qtyStepper_1(_ sender: UIStepper) {
        qtyValue_1 = Int(sender.value)
        qtyLabel_1.text = "\(qtyValue_1)"
        totalAmount()
    }
    
    @IBAction func qtyStepper_2(_ sender: UIStepper) {
        qtyValue_2 = Int(sender.value)
        qtyLabel_2.text = "\(qtyValue_2)"
        totalAmount()
    }
    
    @IBAction func qtyStepper_3(_ sender: UIStepper) {
        qtyValue_3 = Int(sender.value)
        qtyLabel_3.text = "\(qtyValue_3)"
        totalAmount()
    }
    
    @IBAction func qtyStepper_4(_ sender: UIStepper) {
        qtyValue_4 = Int(sender.value)
        qtyLabel_4.text = "\(qtyValue_4)"
        totalAmount()
    }
    
    @IBAction func qtyStepper_5(_ sender: UIStepper) {
        qtyValue_5 = Int(sender.value)
        qtyLabel_5.text = "\(qtyValue_5)"
        totalAmount()
    }
    
    @IBAction func qtyStepper_6(_ sender: UIStepper) {
        qtyValue_6 = Int(sender.value)
        qtyLabel_6.text = "\(qtyValue_6)"
        totalAmount()
    }
    
    func totalAmount() {
       
        let price_1 = cost_1 * qtyValue_1
        let price_2 = cost_2 * qtyValue_2
        let price_3 = cost_3 * qtyValue_3
        let price_4 = cost_4 * qtyValue_4
        let price_5 = cost_5 * qtyValue_5
        let price_6 = cost_6 * qtyValue_6
        
        let totalPrice = 100000-(price_1 + price_2 + price_3 + price_4 + price_5 + price_6)
        totalAmountLabel.text = totalPrice.description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

