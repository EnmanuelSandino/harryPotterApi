//
//  TableViewCell.swift
//  harryPotterApp
//
//  Created by Bootcamp on 7/13/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var stackViewCell: UIStackView!
    
    @IBOutlet weak var characterNameCell: UILabel!
    
    @IBOutlet weak var houseNameCell: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
