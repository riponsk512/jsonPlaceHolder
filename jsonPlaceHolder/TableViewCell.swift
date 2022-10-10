//
//  TableViewCell.swift
//  jsonPlaceHolder
//
//  Created by Ripon sk on 10/10/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var body: UILabel!
    
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

