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
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == .Delete) {
            guard let listViewModel = self.viewModel else {
                return
            }
            listViewModel.removeBotNamed(listViewModel.botList[indexPath.row].text)
            reloadWithAnimation()
        }
    }
    
    func reloadWithAnimation() {
        let range = NSMakeRange(0, tableView.numberOfSections)
        let sections = NSIndexSet(indexesInRange: range)
        tableView.reloadSections(sections, withRowAnimation: .Automatic)
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