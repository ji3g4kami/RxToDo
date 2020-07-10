//
//  TaskListViewController.swift
//  RxToDo
//
//  Created by 登秝吳 on 10/07/2020.
//  Copyright © 2020 登秝吳. All rights reserved.
//

import Foundation
import UIKit

final class TaskListViewController: UIViewController {
  
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var tableView: UITableView!

}

extension TaskListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) 
    
    return cell
  }

}
