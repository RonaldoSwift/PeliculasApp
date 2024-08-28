//
//  HomeView.swift
//  PeliculasApp
//
//  Created by Ronaldo Andre on 23/08/24.
//

import SwiftUI

struct HomeView: View {
    
    var onClickInLogin: () -> Void
    @State private var showModal = false
    
    var body: some View {
        VStack{
            Text("Hello, World!")
            
        }
        .toolbar {
            TextSaveToolbarContent {
                showModal = true
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView(onClickInLogin: {})
}
