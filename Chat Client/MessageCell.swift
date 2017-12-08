//
//  AppDelegate.swift
//  ParseChat
//
//  Created by Avinash Singh on 02/12/17.
//  Copyright © 2017 Avinash Singh. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    @IBOutlet weak var messageLabel: UILabel!

    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
