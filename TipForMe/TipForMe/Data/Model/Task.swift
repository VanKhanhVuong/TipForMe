//
//  Task.swift
//  TipForMe
//
//  Created by Văn Khánh Vương on 18/09/2023.
//

import Foundation

struct Task: Codable {
    var taskId: String
    var taskIcon: String
    var taskTitle: String
    var taskDetail: String
    var tintColor: String
    var isCompletion: Bool
    var date: Date
    
    init(taskId: String = UUID().uuidString, taskIcon: String, taskTitle: String, taskDetail: String, tintColor: String, isCompletion: Bool, date: Date = Date()) {
        self.taskId = taskId
        self.taskIcon = taskIcon
        self.taskTitle = taskTitle
        self.taskDetail = taskDetail
        self.tintColor = tintColor
        self.isCompletion = isCompletion
        self.date = date
    }
}
