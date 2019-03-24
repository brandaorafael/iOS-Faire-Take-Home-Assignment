//
//  ModalProductViewController.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 24/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import UIKit

class ModalProductViewController: UIViewController {
    
    @IBOutlet weak var background:UIImageView!
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var shortDescription:UILabel!
    
    var product:Product!

    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = product.name
        shortDescription.text = product.shortDescription
        
        if(product.images.count > 1){
            if let url = product.images[1].url {
                background.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "faire-formerly-indigo-fair-_logo_201809101436103"))
            }
        } else if (product.images.count == 1) {
            if let url = product.images[0].url {
                background.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "faire-formerly-indigo-fair-_logo_201809101436103"))
            }
        }
    }

    static func initWith(product: Product) -> ModalProductViewController {
        let vc = ModalProductViewController(nibName: "ModalProductViewController", bundle: nil)
        
        vc.product = product
        
        return vc
    }

}
