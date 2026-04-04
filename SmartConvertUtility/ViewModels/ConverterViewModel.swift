//
//  ConverterViewModel.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import Foundation
import Combine

final class ConverterViewModel: ObservableObject {
    @Published var selectedCategory: ConversionCategory = .temperature {
        didSet {
            fromUnit = selectedCategory.units.first ?? ""
            toUnit = selectedCategory.units.dropFirst().first ?? selectedCategory.units.first ?? ""
            resultText = ""
        }
    }

    @Published var inputValue: String = ""
    @Published var fromUnit: String = "Celsius"
    @Published var toUnit: String = "Fahrenheit"
    @Published var resultText: String = ""

    private let conversionService = ConversionService()

    init() {
        fromUnit = selectedCategory.units.first ?? ""
        toUnit = selectedCategory.units.dropFirst().first ?? ""
    }

    func convert() -> Double? {
        let trimmedValue = inputValue.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmedValue.isEmpty else {
            resultText = "Input cannot be empty."
            return nil
        }

        guard let value = Double(trimmedValue) else {
            resultText = "Please enter a valid number."
            return nil
        }

        guard fromUnit != toUnit else {
            resultText = "Please choose different units."
            return nil
        }

        let result = conversionService.convert(
            value: value,
            category: selectedCategory,
            from: fromUnit,
            to: toUnit
        )

        resultText = String(format: "%.2f %@", result, toUnit)
        return result
    }

    func swapUnits() {
        let temp = fromUnit
        fromUnit = toUnit
        toUnit = temp
        _ = convert()
    }
}
