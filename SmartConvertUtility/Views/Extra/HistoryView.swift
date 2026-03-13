//
//  HistoryView.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var appData: AppDataViewModel

    var body: some View {
        List {
            if appData.history.isEmpty {
                Text("No conversion history yet.")
                    .foregroundStyle(.secondary)
            } else {
                ForEach(appData.history) { item in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.category)
                            .font(.headline)
                        Text("\(item.inputValue) \(item.fromUnit) → \(item.result)")
                        Text(item.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .navigationTitle("History")
    }
}
