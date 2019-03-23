//
//  Product.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 22/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import Foundation

class Product {
    
    var token: String
    var name: String
    var shortDescription: String
    var description: String
    var wholesalePriceCents: Int
    var retailPriceCents: Int
    var images: Array<Image>
    
    init(dic: Dictionary<String, Any>){
        self.token = dic["token"] as! String
        self.name = dic["name"] as! String
        self.shortDescription = dic["short_description"] as! String
        self.description = dic["description"] as! String
        self.wholesalePriceCents = dic["wholesale_price_cents"] as! Int
        self.retailPriceCents = dic["retail_price_cents"] as! Int
        
        self.images = Image.createImageArray(array: dic["images"] as! Array<Dictionary<String, Any>>)
        
    }
    
    static func createProductsArray(array: Array<Dictionary<String, Any>>) -> Array<Product> {
        var returnArray: Array<Product> = []
        
        for dic: Dictionary<String, Any> in array {
            returnArray.append(Product.init(dic: dic))
        }
        
        return returnArray
    }
}
