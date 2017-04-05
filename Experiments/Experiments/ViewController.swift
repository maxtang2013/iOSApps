//
//  ViewController.swift
//  Experiments
//
//  Created by max tang on 17/3/29.
//  Copyright © 2017年 TaiLopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let v1 = UIView(frame:CGRect(x:113, y:111, width:132, height:194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView(frame:v1.bounds.insetBy(dx: 10, dy: 10))
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        self.view.addSubview(v1)
        v1.addSubview(v2)
        v1.bounds.origin.x += 10
        v1.bounds.origin.y += 10

        
        
    }

}

