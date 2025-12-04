//
//  LogEntryAppIntent.swift
//  calci_widgetExtension
//
//  Created by Aryan Shaikh on 04/12/2025.
//

import Foundation
import AppIntents

struct LogEntryAppIntent: AppIntent {
    
    static var title: LocalizedStringResource { "Log an entry to your streak" }
    
    static var description: IntentDescription = IntentDescription("Adds 1 to your streak")
    
    func perform() async throws -> some IntentResult & ReturnsValue {
        let data = DataService()
        data.log()
        
        return .result(value: data.progress())
    }
}
