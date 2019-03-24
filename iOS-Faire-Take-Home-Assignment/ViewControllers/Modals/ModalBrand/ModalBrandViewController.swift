//
//  ModalBrandViewController.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 24/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import UIKit

class ModalBrandViewController: UIViewController {

    @IBOutlet weak var background:UIImageView!
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var shortDescription:UILabel!
    
    var brand:Brand!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = brand.name
        shortDescription.text = brand.shortDescription
        
        if(brand.images.count > 1){
            if let url = brand.images[1].url {
                background.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "faire-formerly-indigo-fair-_logo_201809101436103"))
            }
        } else if (brand.images.count == 1) {
            if let url = brand.images[0].url {
                background.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "faire-formerly-indigo-fair-_logo_201809101436103"))
            }
        }
    }
    
    static func initWith(brand: Brand) -> ModalBrandViewController {
        let vc = ModalBrandViewController(nibName: "ModalBrandViewController", bundle: nil)
        
        vc.brand = brand
        
        return vc
    }

}
