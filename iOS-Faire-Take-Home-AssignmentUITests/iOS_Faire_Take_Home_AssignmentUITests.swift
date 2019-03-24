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
        app.navigationBars["Brands"].buttons["baseline filter list black"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Categories"]/*[[".cells.staticTexts[\"Categories\"]",".staticTexts[\"Categories\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["iOS_Faire_Take_Home_Assignment.CategoriesView"].buttons["baseline check black"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Filters"]/*[[".cells.staticTexts[\"Filters\"]",".staticTexts[\"Filters\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let under14DaysStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Under 14 days"]/*[[".cells.staticTexts[\"Under 14 days\"]",".staticTexts[\"Under 14 days\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        under14DaysStaticText.tap()
        under14DaysStaticText.tap()
        under14DaysStaticText.tap()
        under14DaysStaticText.tap()
        under14DaysStaticText.tap()
        under14DaysStaticText.tap()
        under14DaysStaticText.tap()
        under14DaysStaticText.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Under 9 days"]/*[[".cells.staticTexts[\"Under 9 days\"]",".staticTexts[\"Under 9 days\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Under 6 days"]/*[[".cells.staticTexts[\"Under 6 days\"]",".staticTexts[\"Under 6 days\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Charitable"]/*[[".cells.staticTexts[\"Charitable\"]",".staticTexts[\"Charitable\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Eco-friendly"]/*[[".cells.staticTexts[\"Eco-friendly\"]",".staticTexts[\"Eco-friendly\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Handmade"]/*[[".cells.staticTexts[\"Handmade\"]",".staticTexts[\"Handmade\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["iOS_Faire_Take_Home_Assignment.FilterView"].buttons["baseline check black"].tap()
        
        
        
        
    }

}
