//
//  ServiceRequest.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 21/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import Foundation

class ServiceRequest {
    
    public typealias ASServiceBlock = (_ result: Dictionary<String, Any>, _ error:Error?) -> Void
    
    static func request(urlString: String, method: String, body: Dictionary<String, Any>?) -> NSMutableURLRequest {
        //With URLEncoding
        //        let request = NSMutableURLRequest(url: NSURL(string: addQueryStringToURL(url: urlString, params: body))! as URL, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 60.0)
        //        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        //Without URLEncoding
        let request = NSMutableURLRequest(url: NSURL(string: urlString)! as URL, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 10.0 )
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if(body != nil){
            if(!(body?.isEmpty)!){
                do{
                    request.httpBody = try JSONSerialization.data(withJSONObject: body as Any, options: .prettyPrinted)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        
        request.httpMethod = method
        return request
    }
    
    static func dispatchService(object:Bool, serviceRequest: NSMutableURLRequest, serviceblock: @escaping ASServiceBlock){
        DispatchQueue.global(qos: .userInitiated).async {
            let task = URLSession.shared.dataTask(with: serviceRequest as URLRequest, completionHandler: { (responseData: Data?, responseCode: URLResponse?, errorResponse: Error?) in
                DispatchQueue.main.async {
                    //                    NSError *errorResult = nil;
                    if ((errorResponse) != nil) {
                        let result = Dictionary<String, Any>()
                        serviceblock(result, errorResponse);
                        return;
                    }
                    if(object){
                        do {
                            let result = try JSONSerialization.jsonObject(with: responseData!, options: .allowFragments) as? [String: Any]
                            serviceblock(result!, errorResponse);
                        } catch let e {
                            print(e)
                        }
                    } else {
                        do {
                            let result = try JSONSerialization.jsonObject(with: responseData!, options: []
                                ) as? [Any]
                            serviceblock(["result": result!], errorResponse);
                        } catch let e {
                            print(e)
                        }
                    }
                    
                }
            })
            
            task.resume()
        }
    }
}

