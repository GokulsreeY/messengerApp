//
//  PostCell.swift
//  messengerApp
//
//  Created by Gokulsree Yenugadhati on 2/23/17.
//  Copyright © 2017 Gokul Yenugadhati. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
