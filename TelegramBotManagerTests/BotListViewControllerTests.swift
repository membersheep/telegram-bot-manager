//
//  BotListViewControllerTests.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 30/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import XCTest
@testable import TelegramBotManager

class BotListViewControllerTests: XCTestCase {
    
    var viewController: BotListViewController?
    var viewModel = BotListViewModel(botStorage: BotStorageMock())
    
    override func setUp() {
        super.setUp()
        viewController = BotListViewController()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBotListViewControllerCreations() {
        XCTAssertNotNil(viewController)
    }
}
