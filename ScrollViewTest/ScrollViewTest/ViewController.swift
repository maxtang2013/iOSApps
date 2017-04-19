//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by max tang on 17/4/13.
//  Copyright © 2017年 TaiLopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setup()
    }
    
    func setup() {
        let sv = UIScrollView()
        sv.backgroundColor = .white
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        var con = [NSLayoutConstraint]()
        con.append(contentsOf:
            NSLayoutConstraint.constraints(withVisualFormat:
                "H:|[sv]|",
                                           metrics:nil,
                                           views:["sv":sv]))
        con.append(contentsOf:
            NSLayoutConstraint.constraints(withVisualFormat:
                "V:|[sv]|",
                                           metrics:nil,
                                           views:["sv":sv]))
        var previousLab : UILabel? = nil
        for i in 0 ..< 30 {
            let lab = UILabel()
            lab.translatesAutoresizingMaskIntoConstraints = false
            lab.text = "This is label \(i+1)"
            sv.addSubview(lab)
            con.append(contentsOf:
                NSLayoutConstraint.constraints(withVisualFormat:
                    "H:|-(10)-[lab]",
                                               metrics:nil,
                                               views:["lab":lab]))
            if previousLab == nil { // first one, pin to top
                con.append(contentsOf:
                    NSLayoutConstraint.constraints(withVisualFormat:
                        "V:|-(10)-[lab]",
                                                   metrics:nil,
                                                   views:["lab":lab]))
            } else { // all others, pin to previous
                con.append(contentsOf:
                    NSLayoutConstraint.constraints(withVisualFormat:
                        "V:[prev]-(10)-[lab]",
                                                   metrics:nil,
                                                   views:["lab":lab, "prev":previousLab!]))
            }
            previousLab = lab
        }
        // ... everything else as before ...
        // last one, pin to bottom, this dictates content size height!
        con.append(contentsOf:
            NSLayoutConstraint.constraints(withVisualFormat:
                "V:[lab]-(10)-|",
                                           metrics:nil,
                                           views:["lab":previousLab!]))
        //sv.contentSize = CGSize(width:self.view.frame.width,height:2000)
        NSLayoutConstraint.activate(con)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

