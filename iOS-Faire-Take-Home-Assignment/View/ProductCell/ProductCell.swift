//
//  ProductCell.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 22/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var background:UIImageView!
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var price:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setProduct(product: Product) {
        if(product.images.count > 1){
            background.sd_setImage(with: URL(string: product.images[1].url), placeholderImage: UIImage(named: "faire-formerly-indigo-fair-_logo_201809101436103"))
        } else {
            background.sd_setImage(with: URL(string: product.images[0].url), placeholderImage: UIImage(named: "faire-formerly-indigo-fair-_logo_201809101436103"))
        }
        
        self.name.text = product.name
        price.text = "Wholesale $" + String(product.wholesalePriceCents/100)
    }

}
