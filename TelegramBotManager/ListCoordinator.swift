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
    var childCoordinators: [Coordinator] = []
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
        let listController = BotListViewController(nibName: BotListViewController.identifier, bundle: nil)
        listController.inject(botListViewModel)
        listController.delegate = self
        self.navigationController.pushViewController(listController, animated: false)
    }
    
    func showAdd() {
        let viewModel = BotSearchViewModel(botCellViewModel: nil)
        let addController = AddBotViewController(nibName: AddBotViewController.identifier, bundle: nil)
        addController.inject(viewModel)
        addController.delegate = self
        navigationController.topViewController?.presentViewController(addController, animated: true, completion: nil)
    }
    
    func dismissAdd(updatedBotList: BotListViewModel) {
        navigationController.topViewController?.dismissViewControllerAnimated(true, completion: nil)
        guard let listController = navigationController.topViewController as? BotListViewController else {
            return
        }
        listController.inject(updatedBotList)
    }
}

extension ListCoordinator: BotListViewControllerDelegate {
    func addActionPerformed() {
        showAdd()
    }
    
    func detailActionPerformed() {
        // TODO: create detail coordinator and add it to child coordinators
    }
}

extension ListCoordinator: AddBotViewControllerDelegate {
    func dismissiActionPerformed(newBot: BotCellViewModel?) {
        let botStorage = BotStorageDefaults()
        let botListViewModel = BotListViewModel(botStorage: botStorage)
        guard let unwrappedBot = newBot else {
            dismissAdd(botListViewModel)
            return
        }
        dismissAdd(botListViewModel.saveBot(unwrappedBot))
    }
}