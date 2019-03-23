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
    
//    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var longDescription: UILabel!
    @IBOutlet weak var wholesalePrice: UILabel!
    @IBOutlet weak var retailPrice: UILabel!
    
    var product: Product!

    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = product.name
        longDescription.text = product.description
        wholesalePrice.text = "Wholesale - $" + String(product.wholesalePriceCents/100)
        retailPrice.text = "Retail - $" + String(product.retailPriceCents/100)
        
//        picture.sd_setImage(with: URL(string: product.images[0].url), placeholderImage: UIImage(named: "faire-formerly-indigo-fair-_logo_201809101436103"))
        
        var photosURLs = Array<Any>()
        
        for photo in product.images {
            let urlStr = photo.url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let url = URL(string: urlStr!)!
            
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
