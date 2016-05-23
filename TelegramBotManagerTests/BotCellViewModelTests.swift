//
//  BotCellViewModelTests.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 29/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import XCTest
@testable import TelegramBotManager

class BotCellViewModelTests: XCTestCase {

    var botCellViewModel: BotCellViewModel?
    
    override func setUp() {
        super.setUp()
        botCellViewModel = BotCellViewModel(botModel: Bot(name: "test", username: "test", token: "token"))
    }
    
    override func tearDown() {
        
        super.tearDown()
    }

    func testBotCellViewModelCreation() {
        XCTAssertNotNil(botCellViewModel)
    }
    
    func testBotCellViewModelPresentsBotName() {
        let bot = Bot(name: "test", username: "test", token: "token")
        botCellViewModel = BotCellViewModel(botModel: bot)
        
        XCTAssertEqual(botCellViewModel?.text, bot.name)
    }
}
