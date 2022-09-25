//
//  PostCell.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 23.09.2022.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var userIdText: UILabel!
    @IBOutlet weak var idText: UILabel!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var bodyText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bodyText.layoutMargins.bottom = 200
        //cellLayoutMarginsFollowReadableWidth = false
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
