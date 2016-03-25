//
//  TelegramBotManagerTests.swift
//  TelegramBotManagerTests
//
//  Created by Alessandro Maroso on 25/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import XCTest
@testable import TelegramBotManager

class BotStorageDefaultsTests: XCTestCase {
    
    var botStorageDefaults = BotStorageDefaults()
    
    override func setUp() {
        super.setUp()
        botStorageDefaults = BotStorageDefaults()
    }
    
    override func tearDown() {
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(NSBundle.mainBundle().bundleIdentifier!)
        super.tearDown()
    }
    
    func testStoredBotsEmptyAtStart() {
        XCTAssertTrue(botStorageDefaults.storedBots.isEmpty)
    }
}
