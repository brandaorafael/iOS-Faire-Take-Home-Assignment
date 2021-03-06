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
    
    var brand:Brand!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setBrand(brand: Brand) {
        
        self.brand = brand
        
        if(brand.images.count > 1){
            if let url = brand.images[1].url {
                background.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "faire-formerly-indigo-fair-_logo_201809101436103"))
            }
        } else if (brand.images.count == 1) {
            if let url = brand.images[0].url {
                background.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "faire-formerly-indigo-fair-_logo_201809101436103"))
            }
        }
        
        self.name.text = brand.name
    }

}
