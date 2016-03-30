//
//  ViewController.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 25/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import UIKit

class BotListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: BotListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        assert(viewModel != nil, "View model must be set when displaying this controller")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension BotListViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // TODO: Go to Detail controller
    }
}

extension BotListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let listViewModel = viewModel else {
            return 0
        }
        return listViewModel.botList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let listViewModel = self.viewModel else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCellWithIdentifier(BotListTableViewCell.identifier, forIndexPath: indexPath) as! BotListTableViewCell
        let cellViewModel = listViewModel.botList[indexPath.row]
        cell.configure(withViewModel: cellViewModel)
        return cell
    }
}