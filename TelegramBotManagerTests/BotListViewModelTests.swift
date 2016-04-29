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

    var botListViewModel: BotListViewModel!
    var botStorage = BotStorageMock()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testBotListViewModelCreation() {
        botListViewModel = BotListViewModel(botStorage: botStorage)
        XCTAssertNotNil(botListViewModel)
    }
    
    func testBotListViewModelCount() {
        botListViewModel = BotListViewModel(botStorage: botStorage)
        
        XCTAssertEqual(botListViewModel.count, 0)
        XCTAssertEqual(botStorage.storedBots.count, 0)
        
        botStorage.saveBot(Bot(name: "test1", token: "token"))
        botListViewModel = BotListViewModel(botStorage: botStorage)
        
        XCTAssertEqual(botListViewModel.count, 1)
    }
    
    func testBotListViewModelHasCorrectViewModels() {
        botStorage.saveBot(Bot(name: "test1", token: "token"))
        botListViewModel = BotListViewModel(botStorage: botStorage)
        
        XCTAssertEqual(botListViewModel.first?.text, "test1")
        
        botStorage.saveBot(Bot(name: "test2", token: "token"))
        botListViewModel = BotListViewModel(botStorage: botStorage)
        
        XCTAssertEqual(botListViewModel.filter({$0.text == "test1" || $0.text == "test2"}).count, 2)
    }
    
    func testBotListViewModelRemove() {
        botStorage.saveBot(Bot(name: "test1", token: "token"))
        botListViewModel = BotListViewModel(botStorage: botStorage)
        
        XCTAssertEqual(botListViewModel.removeBotNamed("test1").count, 0)
    }
}

