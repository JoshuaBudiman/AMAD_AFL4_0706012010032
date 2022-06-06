//
//  TodoView.swift
//  AFL4_Joshua Kouwa Budiman_0706012010032
//
//  Created by SIFT - Telkom DBT Air 6 on 30/05/22.
//

import SwiftUI

struct TodoView: View {
    @EnvironmentObject var todoViewModel: TodoViewModel
    @AppStorage("_showOnboarding") var showOnboarding : Bool = true
    
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
        
        .fullScreenCover(isPresented: $showOnboarding, content: {
            OnboardingView(showOnboarding: $showOnboarding)
        })
        .navigationTitle("Prio List 📋")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddItemView())
        )
    }
    
}

struct OnboardingView: View {
    @Binding var showOnboarding: Bool
    
    var body: some View{
        
        VStack(alignment: .leading, spacing: 10){
            Text("Welcome to Prio List with this app you can...")
                .multilineTextAlignment(.center)
                .font(.title)
                
            HStack{
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                Spacer()
                Text("Add important tasks to the list")
                    .bold()
                    .padding()
                
                
            }.padding()
            
            
            HStack{
                Image(systemName: "checklist")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                Spacer()
                
                Text("Rearrange your tasks and check finished tasks")
                    .bold()
                    .padding()
            }.padding()
            
            HStack{
                Image(systemName: "delete.left")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                Spacer()
                
                Text("Delete finished or unused tasks")
                    .bold()
                    .padding()
            }.padding()
        }
        .padding(50)
        Spacer()
        
        Button(action: {
            showOnboarding.toggle()
        }, label: {
            Text("Get Started")
                .bold()
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
        })
        .padding()
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


