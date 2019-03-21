//
//  HomeCell.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 21/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var ll:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        ll.layer.borderColor = UIColor.black.cgColor
    }
    
    func setTitle(title: String) {
        ll.text = title
    }

}
