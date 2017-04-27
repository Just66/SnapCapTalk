//
//  UserCell.swift
//  SnapCapTalk
//
//  Created by Dmytro Aprelenko on 20.04.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setCheckmark(selected: false)
    }

    func updateUI(user: User) {
        userName.text = user.firstName
    }
    
    func setCheckmark(selected: Bool) {
        let imgString = selected ? "messageindicatorchecked3" : "messageindicator3"
        self.accessoryView = UIImageView(image: UIImage(named: imgString))
    }
}
