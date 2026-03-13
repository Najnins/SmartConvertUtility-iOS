//
//  ConversionService.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import Foundation

struct ConversionService {

    func convert(value: Double, category: ConversionCategory, from: String, to: String) -> Double {
        guard from != to else { return value }

        switch category {
        case .temperature:
            return convertTemperature(value: value, from: from, to: to)
        case .weight:
            return convertWeight(value: value, from: from, to: to)
        case .length:
            return convertLength(value: value, from: from, to: to)
        case .volume:
            return convertVolume(value: value, from: from, to: to)
        case .speed:
            return convertSpeed(value: value, from: from, to: to)
        case .dataStorage:
            return convertDataStorage(value: value, from: from, to: to)
        }
    }

    private func convertTemperature(value: Double, from: String, to: String) -> Double {
        var celsius = value

        switch from {
        case "Celsius":
            celsius = value
        case "Fahrenheit":
            celsius = (value - 32) * 5 / 9
        case "Kelvin":
            celsius = value - 273.15
        default:
            break
        }

        switch to {
        case "Celsius":
            return celsius
        case "Fahrenheit":
            return celsius * 9 / 5 + 32
        case "Kelvin":
            return celsius + 273.15
        default:
            return value
        }
    }

    private func convertWeight(value: Double, from: String, to: String) -> Double {
        let kg: Double
        switch from {
        case "Kilogram": kg = value
        case "Pound": kg = value * 0.453592
        case "Gram": kg = value / 1000
        default: kg = value
        }

        switch to {
        case "Kilogram": return kg
        case "Pound": return kg / 0.453592
        case "Gram": return kg * 1000
        default: return value
        }
    }

    private func convertLength(value: Double, from: String, to: String) -> Double {
        let meter: Double
        switch from {
        case "Meter": meter = value
        case "Kilometer": meter = value * 1000
        case "Mile": meter = value * 1609.34
        case "Inch": meter = value * 0.0254
        case "Centimeter": meter = value / 100
        default: meter = value
        }

        switch to {
        case "Meter": return meter
        case "Kilometer": return meter / 1000
        case "Mile": return meter / 1609.34
        case "Inch": return meter / 0.0254
        case "Centimeter": return meter * 100
        default: return value
        }
    }

    private func convertVolume(value: Double, from: String, to: String) -> Double {
        let liter: Double
        switch from {
        case "Liter": liter = value
        case "Milliliter": liter = value / 1000
        case "Ounce": liter = value * 0.0295735
        default: liter = value
        }

        switch to {
        case "Liter": return liter
        case "Milliliter": return liter * 1000
        case "Ounce": return liter / 0.0295735
        default: return value
        }
    }

    private func convertSpeed(value: Double, from: String, to: String) -> Double {
        if from == "km/h" && to == "mph" { return value * 0.621371 }
        if from == "mph" && to == "km/h" { return value / 0.621371 }
        return value
    }

    private func convertDataStorage(value: Double, from: String, to: String) -> Double {
        let kb: Double
        switch from {
        case "KB": kb = value
        case "MB": kb = value * 1024
        case "GB": kb = value * 1024 * 1024
        case "TB": kb = value * 1024 * 1024 * 1024
        default: kb = value
        }

        switch to {
        case "KB": return kb
        case "MB": return kb / 1024
        case "GB": return kb / (1024 * 1024)
        case "TB": return kb / (1024 * 1024 * 1024)
        default: return value
        }
    }
}
