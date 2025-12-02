//
//  ContentView.swift
//  Calci
//
//  Created by Aryan Shaikh on 02/12/2025.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("streak") var streak = 0
    
    var body: some View {
        VStack {
            Text(String(streak))
            
            Button(action: {
                streak += 1
            },label: {
                Text("+1")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
