//
//  AddTaskViewController.swift
//  RxToDo
//
//  Created by 登秝吳 on 10/07/2020.
//  Copyright © 2020 登秝吳. All rights reserved.
//

import UIKit
import RxSwift

final class AddTaskViewController: UIViewController {
  
  private let taskSubject = PublishSubject<Task>()
  
  var taskSubjectObservable: Observable<Task> {
    return taskSubject.asObservable()
  }
  
  @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
  @IBOutlet weak var taskTitleField: UITextField!
  
  @IBAction func save() {
    guard let priority = Priority(rawValue: self.prioritySegmentedControl.selectedSegmentIndex),
      let title = self.taskTitleField.text else {
      return
    }
    let task = Task(title: title, priority: priority)
    taskSubject.onNext(task)
    
    self.dismiss(animated: true, completion: nil)
  }
}
