//
//  TimeZoneItem.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import Foundation

struct TimeZoneItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let identifier: String
}
