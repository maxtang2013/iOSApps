//
//  RecordTableViewCell.swift
//  cn.maxtang.IELTSRecorder
//
//  Created by max tang on 17/5/1.
//  Copyright © 2017年 TaiLopez. All rights reserved.
//

import UIKit

class RecordTableViewCell: UITableViewCell {


    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func playButtonTapped(_ sender: Any) {
    }
    
}
