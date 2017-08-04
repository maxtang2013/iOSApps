//
//  ChatBackgroudView.swift
//  Experiments
//
//  Created by max tang on 17/8/2.
//  Copyright © 2017年 TaiLopez. All rights reserved.
//

import UIKit

class ChatBackgroudView: UIView {

    public var innerLabel: UILabel!
    
    override func draw(_ rect: CGRect) {
        let rect = innerLabel.frame.insetBy(dx: -5, dy: -5)
        let p = UIBezierPath(roundedRect: rect, cornerRadius: 5)
        UIColor.gray.setFill()
        p.fill()
    }
}
