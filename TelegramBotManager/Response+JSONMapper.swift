//
//  Response+JSONMapper.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 04/05/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

public extension Response {
    public func mapObject<T: Mappable>(type:T.Type) throws -> T {
        let jsonObject = try mapJSON()
        
        guard let mappedObject = T(jsonData: JSON(jsonObject)) else {
            throw Error.JSONMapping(self)
        }
        
        return mappedObject
    }

    public func mapArray<T: Mappable>(type:T.Type) throws -> [T] {
        let jsonObject = try mapJSON()
        
        let mappedArray = JSON(jsonObject)
        let mappedObjectsArray = mappedArray.arrayValue.flatMap { T(jsonData: $0) }
        
        return mappedObjectsArray
    }
}