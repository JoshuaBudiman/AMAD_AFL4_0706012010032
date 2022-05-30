//
//  AFL4_Joshua_Kouwa_Budiman_0706012010032App.swift
//  AFL4_Joshua Kouwa Budiman_0706012010032
//
//  Created by SIFT - Telkom DBT Air 6 on 30/05/22.
//

import SwiftUI

@main
struct AFL4_Joshua_Kouwa_Budiman_0706012010032App: App {
    
   @StateObject var todoViewModel:TodoViewModel = TodoViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                
                TodoView()
            }
            .environmentObject(todoViewModel)
            
        }
    }
}
