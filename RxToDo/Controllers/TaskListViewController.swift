//
//  TaskListViewController.swift
//  RxToDo
//
//  Created by 登秝吳 on 10/07/2020.
//  Copyright © 2020 登秝吳. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class TaskListViewController: UIViewController {
  
  private let disposeBag = DisposeBag()
  private let tasksRelay = BehaviorRelay<[Task]>(value: [])
  private var filteredTask = [Task]()
  
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var tableView: UITableView!
  

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let navC = segue.destination as? UINavigationController,
      let addTVC = navC.viewControllers.first as? AddTaskViewController else {
        fatalError("Controller not found")
    }
    addTVC.taskSubjectObservable.subscribe(onNext: { [unowned self] task in
      let priority = Priority(rawValue: self.segmentedControl.selectedSegmentIndex - 1)
      let tasks = self.tasksRelay.value + [task]
      self.tasksRelay.accept(tasks)
      self.filterTasks(by: priority)
    })
    .disposed(by: disposeBag)
  }
  
  @IBAction func priorityValueChanged(segmentedControl: UISegmentedControl) {
    let priority = Priority(rawValue: segmentedControl.selectedSegmentIndex - 1)
    filterTasks(by: priority)
  }
  
  private func filterTasks(by priority: Priority?) {
    guard let priority = priority else {
      self.filteredTask = self.tasksRelay.value
      print(filteredTask)
      return
    }
    tasksRelay
      .map { tasks in
        tasks.filter { $0.priority == priority }
      }
    .subscribe(onNext: { [unowned self] tasks in
      self.filteredTask = tasks
      print(self.filteredTask)
    })
    .disposed(by: disposeBag)
  }
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
