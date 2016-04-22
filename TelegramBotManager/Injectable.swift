//
//  Injectable.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 21/04/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation

protocol Injectable {
    associatedtype T
    func inject(_: T)
    func assertDependencies()
}