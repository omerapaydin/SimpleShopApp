//
//  TableViewCell.swift
//  SimpleShopApp
//
//  Created by Ömer on 2.05.2025.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var adLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
