//
//  calci_widget.swift
//  calci_widget
//
//  Created by Aryan Shaikh on 03/12/2025.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    let data = DataService()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), streak: data.progress())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), streak: data.progress())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, streak: data.progress())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let streak: Int
}

struct calci_widgetEntryView : View {
    
    let data = DataService()
    
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white.opacity(0.1), lineWidth: 20)
            
            let pct = Double(data.progress())/100.0
            
            Circle()
                .trim(from: 0, to: pct)
                .stroke(.blue, style:
                            StrokeStyle(lineWidth: 20,
                                        lineCap: .round,
                                        lineJoin: .round))
                .rotationEffect(.degrees(-90))
            
            VStack {
                //                Text("Streak")
                //                    .font(.system(size: 30))
                Text(String(data.progress()))
                    .font(.title)
            }
            .foregroundStyle(.white)
            .fontDesign(.rounded)
            
        }
        .padding()
        .containerBackground(.black, for: .widget)
    }
}

struct calci_widget: Widget {
    let kind: String = "calci_widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                calci_widgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                calci_widgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    calci_widget()
} timeline: {
    SimpleEntry(date: .now, streak: 1)
    SimpleEntry(date: .now, streak: 4)
}
