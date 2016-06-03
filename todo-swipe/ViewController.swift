//
//  ViewController.swift
//  todo-swipe
//
//  Created by Smashing Boxes on 6/3/16.
//  Copyright © 2016 Smashing Boxes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TableViewCellDegelate {
  @IBOutlet weak var tableView: UITableView?
  var toDoItems = [ToDoItem]()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView?.dataSource = self
    tableView?.delegate = self
    tableView?.backgroundColor = UIColor.blackColor()
    tableView?.registerClass(TableViewCell.self, forCellReuseIdentifier: "cell")
    
    if toDoItems.count > 0 {
      return
    }
    
    let constants = [
      "bread", "deli meat", "cheese", "apples", "bananas", "avocado",
      "lettuce", "peppers", "tomatoes", "kale", "onions", "milk", "juice",
      "eggs", "cereal", "yogurt", "bagels", "cat food", "litter",
      "call Mom", "haircut", "party", "cat party", "party with the cat"
    ]
    
    for item in constants {
      toDoItems.append(ToDoItem(text: item))
    }
  }
  
  // MARK: - Table view data source
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return toDoItems.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
    cell.selectionStyle = .None
    let item = toDoItems[indexPath.row]
    cell.delegate = self
    cell.toDoItem = item
    return cell
  }
  
  func toDoItemDeleted(toDoItem: ToDoItem) {
    let index = (toDoItems as NSArray).indexOfObject(toDoItem)
    
    // Could removeAtIndex in the loop but keep it here for when indexOfObject works
    toDoItems.removeAtIndex(index)
    
    // Use the UITableView to animate the removal of this row
    tableView?.beginUpdates()
    let indexPathForRow = NSIndexPath(forRow: index, inSection: 0)
    tableView?.deleteRowsAtIndexPaths([indexPathForRow], withRowAnimation: .Fade)
    tableView?.endUpdates()
  }
  
  // MARK: - Table view delegate
  
  func colorForIndex(index: Int) -> UIColor {
    let itemIndex = toDoItems.count - 1
    let val = (CGFloat(index) / CGFloat(itemIndex)) * 0.6
    return UIColor(red: 1.0, green: val, blue: 0.0, alpha: 1.0)
  }
  
  func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    cell.backgroundColor = colorForIndex(indexPath.row)
  }

}

