//
//  BotTests.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 23/05/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import TelegramBotManager

class BotTests: XCTestCase {
    
    var bot: Bot?
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        bot = nil
        super.tearDown()
    }
    
    func testBotCreation() {
        bot = Bot(name: "test", username: "username", token: "token")
        
        XCTAssertNotNil(bot)
        XCTAssert(bot?.name == "test")
        XCTAssert(bot?.username == "username")
        XCTAssert(bot?.token == "token")
        
    }
    
    func testBotMappingCreation() {
        bot = Bot(jsonData: JSON.parse("{\"ok\": true,\"result\": {\"id\": 208788398,\"first_name\": \"test\",\"username\": \"username\"}}"))
        
        XCTAssertNotNil(bot)
        XCTAssert(bot?.name == "test")
        XCTAssert(bot?.username == "username")
    }
}
