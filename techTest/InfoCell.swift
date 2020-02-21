//
//  infoCell.swift
//  techTest
//
//  Created by Supanut Laddayam on 21/2/2563 BE.
//  Copyright © 2563 Supanut Laddayam. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {


    @IBOutlet weak var infoTableView: UIImageView!
    
    
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        detailLabel.text = "test"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

}
