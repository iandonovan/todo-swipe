//
//  TableViewCellDelegate.swift
//  todo-swipe
//
//  Created by Smashing Boxes on 6/3/16.
//  Copyright © 2016 Smashing Boxes. All rights reserved.
//

import Foundation

// A protocol that the TableViewCell uses to inform its delegate of state change
protocol TableViewCellDegelate {
  // Indicates that the given item has been deleted
  func toDoItemDeleted(toDoItem: ToDoItem)
}
