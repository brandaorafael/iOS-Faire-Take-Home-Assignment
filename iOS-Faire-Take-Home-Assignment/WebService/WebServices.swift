//
//  WebServices.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 21/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import Foundation

class WebService {
    public typealias ASServiceBlock = (_ result: Dictionary<String, Any>) -> Void
    
    static func getAvailableCategories(serviceBlock: @escaping ASServiceBlock) {
        let str = BASE_URL + CATEGORY
        
        let request = ServiceRequest.request(urlString: str, method: "GET", body: nil)
        
        ServiceRequest.dispatchService(object:false, serviceRequest: request, serviceblock: serviceBlock)
    }
    
    static func getMakersWithFilters(leadTime:Int?, makerValues:Array<Int>, page:Int, category:String?, serviceBlock: @escaping ASServiceBlock) {
        let str = BASE_URL + MAKERS
        
        let leadtimeArr = ["FOURTEEN_OR_LESS_DAYS", "NINE_OR_LESS_DAYS", "SIX_OR_LESS_DAYS", "THREE_OR_LESS_DAYS"]
        let makerValuesArr = ["CHARITABLE", "ECO_FRIENDLY", "NOT_SOLD_ON_AMAZON", "HAND_MADE", "MADE_IN_USA"]
        
        var body = Dictionary<String, Any>.init()
        
        // Category
        if(category != nil){
            body["category"] = category
        }
        
        // Lead Time
        if let leadTime = leadTime{
            body["lead_time"] = leadtimeArr[leadTime]
        }
        
        // Maker Values
        var mv = Array<String>.init()
        
        for m in makerValues{
            mv.append(makerValuesArr[m])
        }
        
        body["maker_values"] = mv
        
        // Page
        var paginationData = Dictionary<String, Any>.init()
        
        paginationData["page_size"] = 30
        paginationData["page_number"] = page
        
        body["pagination_data"] = paginationData
        
        //TODO: maximum_maker_minimum_cents
        //TODO: states
        
        let request = ServiceRequest.request(urlString: str, method: "POST", body: body)
        
        ServiceRequest.dispatchService(object:true, serviceRequest: request, serviceblock: serviceBlock)
    }
    
    static func getMakerProducts(brand:String, serviceBlock: @escaping ASServiceBlock) {
        let str = BASE_URL + BRAND + brand + PRODUCTS
        
        let request = ServiceRequest.request(urlString: str, method: "GET", body: nil)
        
        ServiceRequest.dispatchService(object:false, serviceRequest: request, serviceblock: serviceBlock)
    }
}
