//
//  WebServicesTests.swift
//  WebServicesTests
//
//  Created by Rafael Brandão on 24/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import XCTest
@testable import iOS_Faire_Take_Home_Assignment

class WebServicesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDispatchServiceSuccess() {
        
        let promise = expectation(description: "Got no errors")
        
        let str = "https://jsonplaceholder.typicode.com/todos/1"
        
        let request = ServiceRequest.request(urlString: str, method: "GET", body: nil)
        
        ServiceRequest.dispatchService(object:true, serviceRequest: request, serviceblock: { (result: Dictionary<String, Any>, error:Error?) in
            if(error != nil){
                XCTFail("Service error!")
            } else {
                promise.fulfill()
            }
        })
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testDispatchServiceError() {
        
        let promise = expectation(description: "Got errors")
        
        let str = "https://jsonplaceholder"
        
        let request = ServiceRequest.request(urlString: str, method: "GET", body: nil)
        
        ServiceRequest.dispatchService(object:true, serviceRequest: request, serviceblock: { (result: Dictionary<String, Any>, error:Error?) in
            if(error != nil){
                promise.fulfill()
            } else {
                XCTFail("Service error!")
            }
        })
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testGetAvailableCategories() {
        
        let promise = expectation(description: "Got Categories")
        
        WebService.getAvailableCategories(serviceBlock: { (result: Dictionary<String, Any>, error:Error?) in
            if(error != nil){
                XCTFail("Service error!")
            } else {
                promise.fulfill()
            }
        })
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    
    
    //    getMakersWithFilters
    //    getMakerProducts
    
    func testGetMakerProducts() {
        
        let promise = expectation(description: "Got Products")
        
        WebService.getMakerProducts(brand: "b_f0fbd5c7", serviceBlock: { (result: Dictionary<String, Any>, error:Error?) in
            if(error != nil){
                XCTFail("Service error!")
            } else {
                promise.fulfill()
            }
        })
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testGetMakersWithFilters() {
        
        let promise = expectation(description: "Got Makers")
        
        WebService.getMakersWithFilters(leadTime: nil, makerValues: [], page: 1, category: nil, serviceBlock: { (result: Dictionary<String, Any>, error:Error?) in
            if(error != nil){
                XCTFail("Service error!")
            } else {
                promise.fulfill()
            }
        })
        
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
