//
//  AnotherCell.swift
//  Experiments
//
//  Created by max tang on 17/4/21.
//  Copyright © 2017年 TaiLopez. All rights reserved.
//

import UIKit

class AnotherCell: UITableViewCell {

    @IBOutlet weak var theImage: UIImageView!
    @IBOutlet weak var theLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
