//
//  ViewController.swift
//  StateRestoreExmple
//
//  Created by max tang on 17/4/20.
//  Copyright © 2017年 TaiLopez. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UIViewControllerRestoration {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.lightGray
        
        self.title = "RootView"
        
        let push = UIButton()
        push.translatesAutoresizingMaskIntoConstraints = false
        push.titleLabel?.text = "Push"
        push.backgroundColor = UIColor.green
        push.addTarget(self, action: #selector(pushClicked(_:)), for: .touchUpInside)
        view.addSubview(push)
        
        let presentBtn = UIButton()
        presentBtn.translatesAutoresizingMaskIntoConstraints = false
        presentBtn.titleLabel?.text = "Present"
        presentBtn.backgroundColor = UIColor.yellow
        presentBtn.addTarget(self, action: #selector(doPresent(_:)), for: .touchUpInside)
        view.addSubview(presentBtn)
        
        let d : [String:Any] = ["p":push, "pr":presentBtn, "t":topLayoutGuide]
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[p]-|", metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[pr]-|", metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat: "V:[t]-32-[p]-20-[pr]", metrics: nil, views: d),
        ].flatMap{$0})
        
        
    }
    
    @objc func pushClicked(_ sender: UIButton) {
        let vc = type(of:self).makePushedViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    class func makePresentedViewController () -> UIViewController {
        let pvc = PresentedViewController()
        pvc.restorationIdentifier = "presented"
        pvc.restorationClass = self
        return pvc
    }
    class func makePushedViewController() ->  UIViewController {
        let pvc = SecondViewController()
        pvc.restorationIdentifier = "Pushed"
        pvc.restorationClass = self
        return pvc
    }
    func doPresent(_ sender: Any?) {
        let pvc = type(of:self).makePresentedViewController()
        self.present(pvc, animated:true)
    }
    class func viewController(withRestorationIdentifierPath ip: [Any],
                              coder: NSCoder) -> UIViewController? {
        var vc : UIViewController? = nil
        let last = ip.last as! String
        switch last {
            case "presented":
                vc = self.makePresentedViewController()
            case "Pushed":
                vc = self.makePushedViewController()
            default: break
        }
        return vc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

