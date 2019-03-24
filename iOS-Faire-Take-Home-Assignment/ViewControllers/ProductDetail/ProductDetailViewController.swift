//
//  ProductDetailViewController.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 22/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import UIKit
import ImageSlideshow

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var imageSlideShow: ImageSlideshow!
    
    var photoSet: Array<Image> = []
    
    var page = 0
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var longDescription: UILabel!
    @IBOutlet weak var wholesalePrice: UILabel!
    @IBOutlet weak var retailPrice: UILabel!
    @IBOutlet weak var counter: UILabel!
    
    var product: Product!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter.isHidden = true
        counter.layer.borderColor = UIColor.black.cgColor
        counter.layer.borderWidth = 0.5
        counter.layer.cornerRadius = 10.0
        counter.layer.masksToBounds = true
        
        if(product.images.count > 1){
            counter.isHidden = false
            counter.text = String(product.images.count)
        }

        name.text = product.name
        longDescription.text = product.description
        if let wholesalePriceCents = product.wholesalePriceCents {
            wholesalePrice.text = "Wholesale - $" + String(wholesalePriceCents/100)
        }
        if let retailPriceCents = product.retailPriceCents {
            retailPrice.text = "Retail - $" + String(retailPriceCents/100)
        }
        
        var photosURLs = Array<Any>()
        
        for photo in product.images {
            var urlStr = ""
            if let imageUrl = photo.url {
                urlStr = imageUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            }
            
            let url = URL(string: urlStr)!
            
            photosURLs.append(SDWebImageSource.init(url: url, placeholder: nil))
        }
        
        imageSlideShow.setImageInputs(photosURLs as! [InputSource])
        
        imageSlideShow.zoomEnabled = true
        
        imageSlideShow.currentPageChanged = { page in
            self.page = page
        }
        
    }
    
    static func initWith(product: Product) -> ProductDetailViewController {
        let vc = ProductDetailViewController(nibName: nil, bundle: nil)
        
        vc.product = product
        
        return vc
    }

}
