//
//  HomeCell.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 21/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import UIKit
import SDWebImage

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var background:UIImageView!
    @IBOutlet weak var name:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setBackground(url: String, name:String) {
        background.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "faire-formerly-indigo-fair-_logo_201809101436103"))
        self.name.text = name
    }

}
