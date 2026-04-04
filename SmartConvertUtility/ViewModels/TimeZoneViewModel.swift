//
//  TimeZoneViewModel.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import Foundation
import Combine

final class TimeZoneViewModel: ObservableObject {
    @Published var selectedFrom: TimeZoneItem
    @Published var selectedTo: TimeZoneItem

    let zones: [TimeZoneItem] = [
        TimeZoneItem(name: "Toronto", identifier: "America/Toronto"),
        TimeZoneItem(name: "New York", identifier: "America/New_York"),
        TimeZoneItem(name: "London", identifier: "Europe/London"),
        TimeZoneItem(name: "Dhaka", identifier: "Asia/Dhaka"),
        TimeZoneItem(name: "Tokyo", identifier: "Asia/Tokyo"),
        TimeZoneItem(name: "Iran", identifier: "Asia/Tehran"),
        TimeZoneItem(name: "Philippines", identifier: "Asia/Manila"),
        TimeZoneItem(name: "Pakistan", identifier: "Asia/Karachi"),
        TimeZoneItem(name: "India", identifier: "Asia/Kolkata")
    ]

    init() {
        selectedFrom = TimeZoneItem(name: "Toronto", identifier: "America/Toronto")
        selectedTo = TimeZoneItem(name: "Dhaka", identifier: "Asia/Dhaka")
    }

    func currentTime(for zone: TimeZoneItem) -> String {
        guard let timeZone = TimeZone(identifier: zone.identifier) else { return "N/A" }

        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        formatter.timeZone = timeZone
        return formatter.string(from: Date())
    }
}
