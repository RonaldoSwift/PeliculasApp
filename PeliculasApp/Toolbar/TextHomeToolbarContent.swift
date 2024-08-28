//
//  TextHomeToolbarContent.swift
//  PeliculasApp
//
//  Created by Ronaldo Andre on 27/08/24.
//

import Foundation
import SwiftUI

struct TextSaveToolbarContent: ToolbarContent {
    
    var onClick: () -> Void
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Text("Icono")
        }
        
        ToolbarItem(placement: .principal) {
            Text("tituloDePantalla")
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
                onClick()
            }, label: {
                Text("Login")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.yellow)
                    .cornerRadius(10)
            })
        }
    }
    
}
