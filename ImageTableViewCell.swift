//
//  ImageTableViewCell.swift
//  FinalAssessment
//
//  Created by 蔡舜珵 on 2016/8/4.
//  Copyright © 2016年 蔡舜珵. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var tableImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
