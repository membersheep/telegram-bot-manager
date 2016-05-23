//
//  AddBotViewController.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 23/05/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import XCTest
@testable import TelegramBotManager

class AddBotViewControllerTests: XCTestCase {
    
    var viewController: AddBotViewController?
    
    override func setUp() {
        super.setUp()
        viewController = AddBotViewController()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddBotViewControllerCreation() {
        XCTAssertNotNil(viewController)
    }
}