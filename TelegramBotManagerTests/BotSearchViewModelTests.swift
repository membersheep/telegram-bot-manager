//
//  BotSearchViewModelTests.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 24/05/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import XCTest
@testable import TelegramBotManager

class BotSearchViewModelTests: XCTestCase {
    
    var botSearchViewModel: BotSearchViewModel?
    
    override func setUp() {
        super.setUp()
        botSearchViewModel = BotSearchViewModel(botCellViewModel: nil)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testBotSearchViewModelCreation() {
        XCTAssertNotNil(botSearchViewModel)
    }
}
