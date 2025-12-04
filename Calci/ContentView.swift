//
//  ContentView.swift
//  Calci
//
//  Created by Aryan Shaikh on 02/12/2025.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    @AppStorage("streak", store: UserDefaults(suiteName: "group.calciwidget")) var streak = 0
    
    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.1), lineWidth: 20)
                    
                    let pct = Double(streak)/100.0
                    
                    Circle()
                        .trim(from: 0, to: pct)
                        .stroke(.blue, style:
                                    StrokeStyle(lineWidth: 20,
                                                lineCap: .round,
                                                lineJoin: .round))
                        .rotationEffect(.degrees(-90))
                    
                    VStack {
                        Text("Streak")
                            .font(.system(size: 30))
                        Text(String(streak))
                            .font(.system(size: 80))
                    }
                    .foregroundStyle(.white)
                    .fontDesign(.rounded)
                    
                }
                .padding(.horizontal, 50)
                
                Spacer()
                
                Button(action: {
                    streak += 1
                    
                    // Manually reload the widget
                    WidgetCenter.shared.reloadTimelines(ofKind: "calci_widget")
                    
                },label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(.blue)
                            .frame(height: 50)
                        Text("+1")
                            .foregroundStyle(.white )
                    }
                })
                                
            }
            .padding()
            .foregroundStyle(.blue)
        }
        
    }
}

#Preview {
    ContentView()
}
