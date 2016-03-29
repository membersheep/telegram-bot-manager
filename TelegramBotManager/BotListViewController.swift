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
        assert(viewModel != nil, "View model must be set when displaying this controller")
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension BotListViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // TODO: 
    }
}

extension BotListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vm = viewModel else {
            return 0
        }
        return vm.botList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("BotListTableViewCell", forIndexPath: indexPath) as! BotListTableViewCell
//        let viewModel = viewModel.botList[indexPath.row]
//        cell.configure(withViewModel: viewModel)
//        return cell
        return UITableViewCell()
    }

}