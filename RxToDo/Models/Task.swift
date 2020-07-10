//
//  Task.swift
//  RxToDo
//
//  Created by 登秝吳 on 10/07/2020.
//  Copyright © 2020 登秝吳. All rights reserved.
//

enum Priority: Int {
  case high
  case medium
  case low
}

struct Task {
  let title: String
  let priority: Priority
}
