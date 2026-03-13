//
//  BMIViewModel.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import Foundation
import Combine

final class BMIViewModel: ObservableObject {
    @Published var heightText: String = ""
    @Published var weightText: String = ""

    var bmiResult: Double {
        guard let heightCm = Double(heightText),
              let weightKg = Double(weightText),
              heightCm > 0 else { return 0 }

        let heightM = heightCm / 100
        return weightKg / (heightM * heightM)
    }

    var category: String {
        switch bmiResult {
        case 0..<18.5: return "Underweight"
        case 18.5..<25: return "Normal"
        case 25..<30: return "Overweight"
        case 30...: return "Obese"
        default: return "-"
        }
    }
}
