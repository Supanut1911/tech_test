//
//  infoCell.swift
//  techTest
//
//  Created by Supanut Laddayam on 21/2/2563 BE.
//  Copyright © 2563 Supanut Laddayam. All rights reserved.
//

import UIKit
import Kingfisher

class InfoCell: UITableViewCell {


    @IBOutlet weak var infoImageView: UIImageView!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    var myinfo: InfoStruct?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(myinfo)
        
//        if url = URL(string: myinfo)
        
//        let urlString = "https://api.opendota.com"+(hero?.img)!
//        let url = URL(string: urlString)
//        
//        heroImageView.downloaded(from: url!)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
}
