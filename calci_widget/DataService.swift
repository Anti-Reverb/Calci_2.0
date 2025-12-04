//
//  DataService.swift
//  calci_widgetExtension
//
//  Created by Aryan Shaikh on 04/12/2025.
//

import Foundation
import SwiftUI

struct DataService {
    
    @AppStorage("streak", store: UserDefaults(suiteName: "group.calciwidget")) private var streak = 0
    
    func log() {
        streak += 1
    }
    
    func progress() -> Int {
        return streak
    }
}
