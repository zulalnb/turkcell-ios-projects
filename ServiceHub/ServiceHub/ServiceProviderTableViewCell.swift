//
//  ServiceProviderTableViewCell.swift
//  ServiceHub
//
//  Created by Zülal Nebin on 10.11.2026.
//

import UIKit

class ServiceProviderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var serviceCategoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
