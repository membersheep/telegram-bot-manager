//
//  AppCoordinator.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 02/05/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: NSObject, Coordinator {
    let window: UIWindow
    let navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(window: UIWindow) {
        self.navigationController = UINavigationController()
        self.window = window
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()
        super.init()
    }
    
    func start() {
        let listCoordinator = ListCoordinator(navigationController: navigationController);
        listCoordinator.delegate = self
        listCoordinator.start()
        childCoordinators.append(listCoordinator)
    }
}

extension AppCoordinator: ListCoordinatorDelegate {
    
}

extension AppCoordinator: UINavigationControllerDelegate {
    
}