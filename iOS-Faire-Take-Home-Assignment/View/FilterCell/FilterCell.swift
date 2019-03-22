//
//  FilterCell.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 22/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {
    
    @IBOutlet weak var filter:UILabel!
    @IBOutlet weak var icon:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setFilter(filter:String, touched:Bool, unique:Bool){
        self.filter.text = filter
        if(touched){
            if(unique){
                icon.image = UIImage(named: "baseline_radio_button_checked_black")
            } else {
                icon.image = UIImage(named: "baseline_check_box_black")
            }
        } else{
            if(unique){
                icon.image = UIImage(named: "baseline_radio_button_unchecked_black")
            } else {
                icon.image = UIImage(named: "baseline_check_box_outline_blank_black")
            }
        }
    }
    
}
