//
//  Image.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 22/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import Foundation

class Image {
    var token: String
    var url: String
    var type: String?
    
    init(dic: Dictionary<String, Any>){
        self.token = dic["token"] as! String
        self.url = dic["url"] as! String
        if let type = dic["type"] as? String {
            self.type = type
        }
    }
    
    static func createImageArray(array: Array<Dictionary<String, Any>>) -> Array<Image> {
        var returnArray: Array<Image> = []
        
        for dic: Dictionary<String, Any> in array {
            returnArray.append(Image.init(dic: dic))
        }
        
        return returnArray
    }
}
