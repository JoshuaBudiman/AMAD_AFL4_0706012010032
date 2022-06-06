//
//  RowView.swift
//  AFL4_Joshua Kouwa Budiman_0706012010032
//
//  Created by SIFT - Telkom DBT Air 6 on 30/05/22.
//

import SwiftUI

struct RowView: View {
    
    let item: TaskModel
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Image(systemName: item.isDone ? "checkmark.circle": "circle")
                        .foregroundColor(item.isDone ? .green : .red)
                    Text(item.title)
                        .strikethrough(item.isDone ? true : false)
                    Spacer()
                    
                }
                .font(.title2)
                .padding(.vertical, 8)
                HStack {
                    Text("Deadline: \(item.date)" )
                        .strikethrough(item.isDone ? true : false)
                    Spacer()
                }
                .font(.title3)
                .padding(.vertical, 8)
            }
            Spacer()
        }
    }
}

struct RowView_Previews: PreviewProvider {
    
    static var item1 = TaskModel(title: "First Item", isDone: false, date: "Jun 6, 2022, 1:26 PM")
    static var item2 = TaskModel(title: "Second Item", isDone: true, date: "Jun 6,2022, 1:30 PM")
    
    static var previews: some View {
        Group{
            RowView(item: item1)
            RowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
