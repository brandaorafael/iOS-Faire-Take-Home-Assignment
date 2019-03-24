//
//  Category.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 22/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import Foundation

class Category {
    
    var name: String?
//    var subCategories:Array<Category>
    
    init(dic: Dictionary<String, Any>){
        self.name = dic["name"] as? String
        
//        self.subCategories = Category.createCategoryArray(array: dic["sub_categories"] as! Array<Dictionary<String, Any>>)
        
    }
    
    static func createCategoryArray(array: Array<Dictionary<String, Any>>) -> Array<Category> {
        var returnArray: Array<Category> = []
        
        for dic: Dictionary<String, Any> in array {
            returnArray.append(Category.init(dic: dic))
            
            if(!(dic["sub_categories"] as! Array<Dictionary<String, Any>>).isEmpty){
                for d:Dictionary<String, Any> in dic["sub_categories"] as! Array<Dictionary<String, Any>>{
                    returnArray.append(Category.init(dic: d))
                }
            }
        }
        
        return returnArray
    }
}
