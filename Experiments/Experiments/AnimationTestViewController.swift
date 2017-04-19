//
//  AnimationTestViewController.swift
//  Experiments
//
//  Created by max tang on 17/4/8.
//  Copyright © 2017年 TaiLopez. All rights reserved.
//

import UIKit

class AnimationTestViewController: UIViewController {

    private var compassView : CompassView?
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    private func setup() {
        compassView = CompassView(frame: CGRect(30, 250, 160, 160));
        self.view.addSubview(compassView!)
        delay(1) {
            let opts : UIViewAnimationOptions = .autoreverse
            let xorig = self.compassView?.center.x
            UIView.animate(withDuration:1, delay: 0, options: opts, animations: {
                self.compassView?.center.x += 100
            }, completion: { _ in
                self.compassView?.center.x = xorig!
            })
        }
    }
}
