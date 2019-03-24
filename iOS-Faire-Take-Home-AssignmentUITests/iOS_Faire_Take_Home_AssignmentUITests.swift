//
//  iOS_Faire_Take_Home_AssignmentUITests.swift
//  iOS-Faire-Take-Home-AssignmentUITests
//
//  Created by Rafael Brandão on 21/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import XCTest

class iOS_Faire_Take_Home_AssignmentUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCategories() {
        
        let app = XCUIApplication()
        let baselineFilterListBlackButton = app.navigationBars["Brands"].buttons["baseline filter list black"]
        baselineFilterListBlackButton.tap()
        
        let categoriesStaticText = app.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Categories"]/*[[".cells.staticTexts[\"Categories\"]",".staticTexts[\"Categories\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        categoriesStaticText.tap()
        let item = app.navigationBars["iOS_Faire_Take_Home_Assignment.CategoriesView"].buttons["baseline check black"]
        item.tap()
        app.navigationBars["iOS_Faire_Take_Home_Assignment.PreFilterView"].buttons["Brands"].tap()
        baselineFilterListBlackButton.tap()
        categoriesStaticText.tap()
        
        
        
    }

}
