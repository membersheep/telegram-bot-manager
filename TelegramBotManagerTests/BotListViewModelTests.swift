//
//  BotListViewModelTests.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 29/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import XCTest
@testable import TelegramBotManager

class BotListViewModelTests: XCTestCase {

    var botListViewModel: BotListViewModel?
    var botStorage = BotStorageMock()
    
    override func setUp() {
        super.setUp()
        botListViewModel = BotListViewModel(botStorage: botStorage)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testBotListViewModelCreation() {
        XCTAssertNotNil(botListViewModel)
    }
    
    func testBotCellViewModelListCount() {
        XCTAssertEqual(botListViewModel?.botList.count, 0)
        XCTAssertEqual(botStorage.storedBots.count, 0)
        
        botStorage.saveBot(Bot(name: "test1", token: "token"))
        
        XCTAssertEqual(botListViewModel?.botList.count, 1)
        
        botStorage.saveBot(Bot(name: "test2", token: "token"))
        botStorage.saveBot(Bot(name: "test3", token: "token"))
        
        XCTAssertEqual(botListViewModel?.botList.count, 3)
        
        botStorage.removeBotNamed("test1")
        
        XCTAssertEqual(botListViewModel?.botList.count, 2)
    }
    
    func testBotCellViewModelListHasCorrectViewModels() {
        botStorage.saveBot(Bot(name: "test1", token: "token"))
        
        XCTAssertEqual(botListViewModel?.botList.first?.text, "test1")
        
        botStorage.saveBot(Bot(name: "test2", token: "token"))
        
        XCTAssertEqual(botListViewModel?.botList.filter({$0.text == "test1" || $0.text == "test2"}).count, 2)
    }
}

class BotStorageMock: BotStorage {
    var storedBots: [Bot] = []
    
    func saveBot(bot: Bot) {
        storedBots.append(bot)
    }
    
    func removeBotNamed(name: String) {
        guard let index = storedBots.indexOf({$0.name == name}) else {
            return
        }
        storedBots.removeAtIndex(index)
    }
}