//
//  TaskViewModel.swift
//  TipForMe
//
//  Created by Văn Khánh Vương on 18/09/2023.
//

import Foundation

protocol TaskViewModelEvents: AnyObject { 
    func reloadListData()
    func reloadOneRow(index: IndexPath)
}

class TaskViewModel {
    weak var delegate: TaskViewModelEvents?
    
    var arrTask = [
        Task(taskIcon: "", taskTitle: "Title 1", taskDetail: "Description task 1", tintColor: "redSystem", isCompletion: false),
        Task(taskIcon: "", taskTitle: "Title 2", taskDetail: "Description task 2", tintColor: "pinkSystem", isCompletion: true),
        Task(taskIcon: "", taskTitle: "Title 3", taskDetail: "Description task 3", tintColor: "blueSystem", isCompletion: true),
        Task(taskIcon: "", taskTitle: "Title 4", taskDetail: "Description task 4", tintColor: "greenSystem", isCompletion: false),
        Task(taskIcon: "", taskTitle: "Title 5", taskDetail: "Description task 5", tintColor: "redSystem", isCompletion: false),
        Task(taskIcon: "", taskTitle: "Title 6", taskDetail: "Description task 6", tintColor: "blueSystem", isCompletion: true),
        Task(taskIcon: "", taskTitle: "Title 7", taskDetail: "Description task 7", tintColor: "redSystem", isCompletion: true),
        Task(taskIcon: "", taskTitle: "Title 8", taskDetail: "Description task 8", tintColor: "blueSystem", isCompletion: false),
        Task(taskIcon: "", taskTitle: "Title 9", taskDetail: "Description task 9", tintColor: "redSystem", isCompletion: false),
        Task(taskIcon: "", taskTitle: "Title 10", taskDetail: "Description task 10", tintColor: "blueSystem", isCompletion: false),
    ]
    
    func deleteTask(id: String) {
        for (index, element) in arrTask.enumerated() {
            if element.taskId == id {
                arrTask.remove(at: index)
            }
        }
        
        self.delegate?.reloadListData()
    }
    
    func checkDone(index: IndexPath) {
        arrTask[index.row].isCompletion = !arrTask[index.row].isCompletion
        self.delegate?.reloadOneRow(index: index)
    }
}

