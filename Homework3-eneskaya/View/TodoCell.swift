//
//  TodoCell.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 21.09.2022.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var checkmarkImage: UIImageView!
    var isChecked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
