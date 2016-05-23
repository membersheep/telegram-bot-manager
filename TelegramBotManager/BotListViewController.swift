//
//  ViewController.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 25/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import UIKit

protocol BotListViewControllerDelegate: class {
    func addActionPerformed()
    func detailActionPerformed()
}

class BotListViewController: UIViewController {
    static let identifier = "BotListViewController"
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: CircularAddButton!
    weak var delegate: BotListViewControllerDelegate?
    
    private var botListViewModel: BotListViewModel! {
        didSet {
            reloadWithAnimation()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: BotTableViewCell.identifier, bundle:nil), forCellReuseIdentifier: BotTableViewCell.identifier)
        assertDependencies()
        // TODO: Decide where to put these customizations.
        self.edgesForExtendedLayout = UIRectEdge.None
        addButton.circleColor = UIColor.lightMainColor()
    }
    
    @IBAction func addButtonPressed(sender: AnyObject) {
        delegate?.addActionPerformed()
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
    func inject(botListViewModel: BotListViewModel) {
        self.botListViewModel = botListViewModel;
    }
    
    func assertDependencies() {
        assert(botListViewModel != nil, "View model must be set when displaying this controller")
        assert(tableView != nil, "Table view must be set")
        assert(addButton != nil, "Add button must be set")
        assert(tableView.delegate != nil, "Table view should have a delegate set")
        assert(tableView.dataSource != nil, "Table view should have a data source set")
    }
}

extension BotListViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // TODO: Parametrize to pass data. What must be passed? Ad Hoc model or ViewModel?
        delegate?.detailActionPerformed()
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == .Delete) {
            let cellName = botListViewModel[indexPath.row].text
            botListViewModel = botListViewModel.removeBotNamed(cellName)
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // TODO: Find a better way to extract the height value from the cell.
        return 82.0
    }
}

extension BotListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return botListViewModel.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(BotTableViewCell.identifier, forIndexPath: indexPath) as! BotTableViewCell
        let cellViewModel = botListViewModel[indexPath.row]
        cell.configure(withViewModel: cellViewModel)
        return cell
    }
}