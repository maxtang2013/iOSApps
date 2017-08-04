//
//  SecondViewController.swift
//  StateRestoreExmple
//
//  Created by max tang on 17/4/20.
//  Copyright © 2017年 TaiLopez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    init() {
        super.init(nibName:nil, bundle:nil)
        self.restorationIdentifier = "Pushed"
        self.title = "Pushed"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.restorationIdentifier = "Pushed"
        self.title = "Pushed"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Pushed"
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.brown
        
        let rightItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(OKclicked))
        self.navigationItem.rightBarButtonItem = rightItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        

    }
    
    @objc func OKclicked() {
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
