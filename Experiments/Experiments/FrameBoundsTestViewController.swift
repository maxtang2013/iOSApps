//
//  FrameBoundsTestViewController.swift
//  Experiments
//
//  Created by max tang on 17/8/2.
//  Copyright © 2017年 TaiLopez. All rights reserved.
//

import UIKit

class FrameBoundsTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createSubviews()
    }
    
    
    private func createSubviews() {
        let l = UILabel()
        l.text = "Hello"
        let b = ChatBackgroudView(frame: self.view.bounds)
        b.backgroundColor = .white
        b.innerLabel = l
        
        b.clipsToBounds = false
        view.addSubview(b)
        self.view.addSubview(l)
        
        let v1 = UIView(frame:CGRect(113, 111, 132, 194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView(frame:v1.bounds.insetBy(dx: 10, dy: 10))
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        self.view.addSubview(v1)
        v1.addSubview(v2)
        v1.bounds.origin.x += 8
        v1.bounds.origin.y += 8
        

        
        l.translatesAutoresizingMaskIntoConstraints = false
        let d: [String:UIView] = ["l":l]
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-40-[l]",  metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[l]",  metrics: nil, views: d),
            ].flatMap({$0}))
    }
}
