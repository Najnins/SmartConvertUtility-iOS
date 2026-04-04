//
//  ConversionRecord.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//

import Foundation

struct ConversionRecord: Identifiable, Codable {
    var id = UUID()
    let category: String
    let inputValue: String
    let fromUnit: String
    let toUnit: String
    let result: String
    let date: Date
}
