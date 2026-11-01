//
//  PersonTableViewCell.swift
//  CustomPersonTableView
//
//  Created by Zülal Nebin on 1.11.2026.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var genderImageView: UIImageView!
    @IBOutlet weak var fullnameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
