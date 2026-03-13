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
        guard let value = Double(inputValue) else {
            resultText = "Enter a valid number"
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
