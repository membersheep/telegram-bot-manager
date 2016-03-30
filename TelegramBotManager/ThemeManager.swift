//
//  ThemeManager.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 30/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation
import UIKit

struct ThemeManager {
    static func applyTheme() {
        let sharedApplication = UIApplication.sharedApplication()
        sharedApplication.delegate?.window??.tintColor = UIColor.whiteColor()
        
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.barTintColor = UIColor.mainColor()
        navBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
}

extension UIColor {
    class func mainColor() -> UIColor{
        return UIColor.init(colorLiteralRed: 100.0/255.0, green: 137.0/255.0, blue: 168.0/255.0, alpha: 1)
    }
    
    class func lightMainColor() -> UIColor{
        return UIColor.init(colorLiteralRed: 44.0/255.0, green: 165.0/255.0, blue: 224.0/255.0, alpha: 1)
    }
}