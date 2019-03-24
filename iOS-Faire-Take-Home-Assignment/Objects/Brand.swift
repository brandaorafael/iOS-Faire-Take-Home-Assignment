//
//  Brand.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 21/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import Foundation

class Brand {
    
    var token: String?
    var name: String?
    var shortDescription: String?
    var description: String?
    var url: String?
    var images: Array<Image>
    
    init(dic: Dictionary<String, Any>){
        self.token = dic["token"] as? String
        self.name = dic["name"] as? String
        self.shortDescription = dic["short_description"] as? String
        self.description = dic["description"] as? String
        self.url = dic["url"] as? String
        
        self.images = Image.createImageArray(array: dic["images"] as! Array<Dictionary<String, Any>>)
        
    }
    
    static func createBrandArray(array: Array<Dictionary<String, Any>>) -> Array<Brand> {
        var returnArray: Array<Brand> = []
        
        for dic: Dictionary<String, Any> in array {
            returnArray.append(Brand.init(dic: dic))
        }
        
        return returnArray
    }
}

