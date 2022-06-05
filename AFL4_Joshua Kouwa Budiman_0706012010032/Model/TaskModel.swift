//
//  TaskModel.swift
//  AFL4_Joshua Kouwa Budiman_0706012010032
//
//  Created by SIFT - Telkom DBT Air 6 on 30/05/22.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    let id: String
    let title: String
    let isDone: Bool
    
    init(id:String = UUID().uuidString, title: String, isDone: Bool){
        self.id = id
        self.title = title
        self.isDone = isDone
    }
    
    func updateCompletion() -> TaskModel {
        return TaskModel(id: id, title: title, isDone: !isDone )
    }
}
