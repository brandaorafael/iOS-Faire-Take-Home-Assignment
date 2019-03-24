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
    
//    getMakersWithFilters
//    getMakerProducts

    func testgetAvailableCategories() {
        
        let promise = expectation(description: "Got Categories")
        
        WebService.getAvailableCategories(serviceBlock: { (result: Dictionary<String, Any>) in
            if(result.count == 0){
                XCTFail("Categories returned empty")
            } else {
                promise.fulfill()
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
