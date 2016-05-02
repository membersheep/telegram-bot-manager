//
//  ListCoordinator.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 02/05/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation
import UIKit

protocol ListCoordinatorDelegate {
    
}

class ListCoordinator: NSObject {
    let navigationController: UINavigationController
    var delegate: ListCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
}

extension ListCoordinator: Coordinator {
    func start() {
        let botStorage = BotStorageDefaults()
        let botListViewModel = BotListViewModel(botStorage: botStorage)
        let listController = BotListViewController(nibName: "BotListViewController", bundle: nil)
        listController.inject(botListViewModel)
        self.navigationController.pushViewController(listController, animated: false)
    }
}

extension ListCoordinator: BotListViewControllerDelegate {
    func addAction() {
        
    }
    
    func detailAction() {
        
    }
}