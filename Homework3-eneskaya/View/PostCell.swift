//
//  PostCell.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 23.09.2022.
//

import UIKit

// Post feed cell 

class PostCell: UITableViewCell {
    @IBOutlet weak var userIdText: UILabel!
    @IBOutlet weak var idText: UILabel!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var bodyText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bodyText.layoutMargins.bottom = 200
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
