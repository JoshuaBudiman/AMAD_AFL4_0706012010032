//
//  EmptyListView.swift
//  AFL4_Joshua Kouwa Budiman_0706012010032
//
//  Created by SIFT - Telkom DBT Air 6 on 05/06/22.
//

import SwiftUI

struct EmptyListView: View {
    
    @State var animate : Bool = false
    
    var body: some View {
        ScrollView{
            VStack (spacing: 10){
                Text("There are no tasks!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a busy person and need to keep track of what tasks you should be doing? Click on the add button and start listing your tasks!")
                
            }
            .multilineTextAlignment(.center)
            .padding(15)
            .onAppear(perform: addAnimation)
            .scaleEffect(animate ? 1.05 : 1.0)
            .foregroundColor(Color.white)
            .colorMultiply(animate ? Color.accentColor : Color.black)
            .shadow(color: animate ? Color.purple.opacity(0.50) : Color.black.opacity(0.60),
                    radius: animate ? 10 : 1,
                    x: 2,
                    y: 4)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmptyListView()
                .navigationTitle("Title")
        }
        
    }
}
