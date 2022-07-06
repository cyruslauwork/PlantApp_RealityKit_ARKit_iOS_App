//
//  ProgressViewController.swift
//  PlantApp
//
//  Created by Leung Yuet Yi on 16/7/2021.
//

import UIKit

class OldProgressViewController: UIViewController {
    
    let shape = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let circlePath = UIBezierPath(arcCenter: view.center,
                                      radius:150,
                                      startAngle: -(.pi / 2),
                                      endAngle: .pi * 2,
                                      clockwise:true)
        
        let trackShape = CAShapeLayer()
        trackShape.path = circlePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 15
        trackShape.strokeColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(trackShape)
        
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 15
        shape.strokeColor = UIColor.blue.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)
        
        let button = UIButton(frame: CGRect(x: 20, y: view.frame.size.height-70,width: view.frame.size.width-40,height:50))
        view.addSubview(button)
        button.setTitle("Enter", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc func didTapButton() {
        // Animate
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "Enter")
    }

}


