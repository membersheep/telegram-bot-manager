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
    @IBOutlet weak var addButton: CircularAddButton!
    
    private var viewModel: BotListViewModel! {
        didSet {
            reloadWithAnimation()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        assertDependencies()
        
        // TODO: Decide where to put these customizations.
        self.edgesForExtendedLayout = UIRectEdge.None
        addButton.circleColor = UIColor.lightMainColor()
    }
    
    @IBAction func addButtonPressed(sender: AnyObject) {
        print("go to add bot")
    }
    
    func reloadWithAnimation() {
        guard let unwrappedTableView = tableView else {
            return
        }
        let range = NSMakeRange(0, unwrappedTableView.numberOfSections)
        let sections = NSIndexSet(indexesInRange: range)
        unwrappedTableView.reloadSections(sections, withRowAnimation: .Automatic)
    }
}

extension BotListViewController: Injectable {
    func inject(viewModel: BotListViewModel) {
        self.viewModel = viewModel;
    }
    
    func assertDependencies() {
        assert(viewModel != nil, "View model must be set when displaying this controller")
        assert(tableView != nil, "Table view must be set")
        assert(addButton != nil, "Add button must be set")
        assert(tableView.delegate != nil, "Table view should have a delegate set")
        assert(tableView.dataSource != nil, "Table view should have a data source set")
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
            viewModel = viewModel.removeBotNamed(viewModel.botList[indexPath.row].text)
        }
    }
}

extension BotListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.botList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(BotListTableViewCell.identifier, forIndexPath: indexPath) as! BotListTableViewCell
        let cellViewModel = viewModel.botList[indexPath.row]
        cell.configure(withViewModel: cellViewModel)
        return cell
    }
}