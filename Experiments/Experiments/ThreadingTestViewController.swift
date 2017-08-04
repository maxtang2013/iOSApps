//
//  ThreadingTestViewController.swift
//  Experiments
//
//  Created by max tang on 17/8/4.
//  Copyright © 2017年 TaiLopez. All rights reserved.
//

import UIKit

class ThreadingTestViewController: UIViewController {

    private var button:UIButton!
    private var mandelbrotView: MyMandelbrotView!
    override func viewDidLoad() {
        super.viewDidLoad()

        createSubViews()
    }
    
    private func createSubViews() {
        button = UIButton()
        button.setTitle("Click Me", for: .normal)
        button.setTitle("Clicking", for: .highlighted)
        button.setBackgroundImage(UIImage(named:"bg"), for: .normal)
        button.setBackgroundImage(UIImage(named:"highlighted"), for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onButtonClicked), for: .touchUpInside)
        self.view.addSubview(button)
        
        mandelbrotView = MyMandelbrotView()
        mandelbrotView.backgroundColor = .white
        mandelbrotView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mandelbrotView)
        
        let d: [String:UIView] = ["m":mandelbrotView, "b":button]
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-200-[b(110)]",  metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-200-[b(50)]",  metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-250-[m]-|",  metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[m]-|",  metrics: nil, views: d),
            ].flatMap({$0}))
    }

    func onButtonClicked() {
        mandelbrotView.drawThatPuppy()
    }
}
