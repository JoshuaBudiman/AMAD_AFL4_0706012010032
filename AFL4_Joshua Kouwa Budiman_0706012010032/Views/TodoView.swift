//
//  TodoView.swift
//  AFL4_Joshua Kouwa Budiman_0706012010032
//
//  Created by SIFT - Telkom DBT Air 6 on 30/05/22.
//

import SwiftUI

struct TodoView: View {
    @EnvironmentObject var todoViewModel: TodoViewModel
    
    
    var body: some View {
        ZStack{
            if todoViewModel.items.isEmpty {
                EmptyListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else {
                List{
                    ForEach(todoViewModel.items){item in
                        RowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    todoViewModel.updateItem(item: item)
                                }
                            }
                    }.onDelete(perform: todoViewModel.deleteItem)
                        .onMove(perform: todoViewModel.moveItem)
                }
                
                .listStyle(PlainListStyle())
            }
        }
        
        
        .navigationTitle("Prio List 📋")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddItemView())
        )
    }
    
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TodoView()
        }
        .environmentObject(TodoViewModel())
    }
}


