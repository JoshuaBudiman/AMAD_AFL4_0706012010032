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
            Image(systemName: item.isDone ? "checkmark.circle": "circle")
                .foregroundColor(item.isDone ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct RowView_Previews: PreviewProvider {
    
    static var item1 = TaskModel(title: "First Item", isDone: false)
    static var item2 = TaskModel(title: "Second Item", isDone: true)
    
    static var previews: some View {
        Group{
            RowView(item: item1)
            RowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
