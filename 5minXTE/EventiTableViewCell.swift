//
//  EventiTableViewCell.swift
//  5minXTE
//
//  Created by Luca Christille on 29/04/16.
//  Copyright © 2016 Luca Christille. All rights reserved.
//

import UIKit

class EventiTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblEvento: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
