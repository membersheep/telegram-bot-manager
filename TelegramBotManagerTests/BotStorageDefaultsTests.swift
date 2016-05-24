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
        clearDefaults()
        botStorageDefaults = BotStorageDefaults()
    }
    
    func clearDefaults() {
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(NSBundle.mainBundle().bundleIdentifier!)
    }
    
    override func tearDown() {
        clearDefaults()
        super.tearDown()
    }
    
    func testStoredBotsEmptyAtStart() {
        XCTAssertTrue(botStorageDefaults.storedBots.isEmpty)
    }
    
    func testSaveBotStoresABot() {
        XCTAssertTrue(botStorageDefaults.storedBots.isEmpty)
        
        botStorageDefaults.saveBot(Bot(name: "test", username: "test", token: "token"))
        
        XCTAssertFalse(botStorageDefaults.storedBots.isEmpty)
        XCTAssertEqual(botStorageDefaults.storedBots[0].name, "test")
        XCTAssertEqual(botStorageDefaults.storedBots[0].token, "token")
    }
    
    func testSaveBotStoresMultipleBots() {
        XCTAssertTrue(botStorageDefaults.storedBots.isEmpty)
        
        botStorageDefaults.saveBot(Bot(name: "test0", username: "test", token: "token"))
        botStorageDefaults.saveBot(Bot(name: "test1", username: "test", token: "token"))
        botStorageDefaults.saveBot(Bot(name: "test2", username: "test", token: "token"))
        botStorageDefaults.saveBot(Bot(name: "test3", username: "test", token: "token"))
        botStorageDefaults.saveBot(Bot(name: "test4", username: "test", token: "token"))
        
        XCTAssertFalse(botStorageDefaults.storedBots.isEmpty)
        XCTAssertEqual(botStorageDefaults.storedBots.count, 5)
    }
    
    func testSaveBotOverwritesExistingBot() {
        XCTAssertTrue(botStorageDefaults.storedBots.isEmpty)
        botStorageDefaults.saveBot(Bot(name: "test", username: "test", token: "token"))
        
        botStorageDefaults.saveBot(Bot(name: "test", username: "test", token: "modifiedToken"))
        
        XCTAssertEqual(botStorageDefaults.storedBots.count, 1)
        XCTAssertTrue(botStorageDefaults.storedBots.filter{ $0.name == "test" }[0].token == "modifiedToken")
    }
    
    func testRemoveBotRemovesABot() {
        botStorageDefaults.saveBot(Bot(name: "test", username: "test", token: "token"))
        XCTAssertFalse(botStorageDefaults.storedBots.isEmpty)
        
        botStorageDefaults.removeBotNamed("test")
        
        XCTAssertTrue(botStorageDefaults.storedBots.isEmpty)
    }
    
    func testRemoveBotOnEmptyStore() {
        botStorageDefaults.removeBotNamed("")
        
        XCTAssertTrue(botStorageDefaults.storedBots.isEmpty)
    }
}
