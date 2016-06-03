//
//  ToDoItem.swift
//  todo-swipe
//
//  Created by Smashing Boxes on 6/3/16.
//  Copyright © 2016 Smashing Boxes. All rights reserved.
//

import Foundation

class ToDoItem {
  var text: String
  var completed: Bool
  
  init(text: String) {
    self.text = text
    self.completed = false
  }
}
