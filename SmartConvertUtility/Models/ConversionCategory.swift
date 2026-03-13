//
//  ConversionCategory.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import Foundation

enum ConversionCategory: String, CaseIterable, Identifiable {
    case temperature = "Temperature"
    case weight = "Weight"
    case length = "Length"
    case volume = "Volume"
    case speed = "Speed"
    case dataStorage = "Data Storage"

    var id: String { rawValue }

    var units: [String] {
        switch self {
        case .temperature:
            return ["Celsius", "Fahrenheit", "Kelvin"]
        case .weight:
            return ["Kilogram", "Pound", "Gram"]
        case .length:
            return ["Meter", "Kilometer", "Mile", "Inch", "Centimeter"]
        case .volume:
            return ["Liter", "Milliliter", "Ounce"]
        case .speed:
            return ["km/h", "mph"]
        case .dataStorage:
            return ["KB", "MB", "GB", "TB"]
        }
    }
}
