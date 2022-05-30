//
//  TodoViewModel.swift
//  AFL4_Joshua Kouwa Budiman_0706012010032
//
//  Created by SIFT - Telkom DBT Air 6 on 30/05/22.
//

import Foundation

class TodoViewModel: ObservableObject {
    
    @Published var items: [TaskModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [
            TaskModel(title: "This is the first task", isDone: false),
            TaskModel(title: "This is the second!", isDone: true),
            TaskModel(title: "Third", isDone: false)]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }

    func addItem(title: String) {
        let newItem = TaskModel(title: title, isDone: false)
        items.append(newItem)
    }
    
    func updateItem(item: TaskModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
}
