//
//  BMIViewModel.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import Foundation
import Combine
import SwiftUI

enum BMIUnitSystem: String, CaseIterable, Identifiable {
    case metric = "Metric (cm / kg)"
    case imperial = "Imperial (ft, in / lbs)"

    var id: String { rawValue }
}

final class BMIViewModel: ObservableObject {
    @Published var unitSystem: BMIUnitSystem = .metric

    // Metric inputs
    @Published var heightCmText: String = ""
    @Published var weightKgText: String = ""

    // Imperial inputs
    @Published var heightFeetText: String = ""
    @Published var heightInchesText: String = ""
    @Published var weightLbsText: String = ""

    @Published var errorMessage: String = ""

    // MARK: - Computed BMI

    var bmiResult: Double {
        switch unitSystem {
        case .metric:
            guard let heightCm = Double(heightCmText),
                  let weightKg = Double(weightKgText),
                  heightCm > 0, weightKg > 0 else { return 0 }
            let heightM = heightCm / 100
            return weightKg / (heightM * heightM)

        case .imperial:
            let feet = Double(heightFeetText) ?? 0
            let inches = Double(heightInchesText) ?? 0
            guard let weightLbs = Double(weightLbsText),
                  (feet > 0 || inches > 0), weightLbs > 0 else { return 0 }
            let totalInches = feet * 12 + inches
            return (weightLbs / (totalInches * totalInches)) * 703
        }
    }

    var category: String {
        switch bmiResult {
        case 0: return "-"
        case ..<18.5: return "Underweight"
        case 18.5..<25: return "Normal"
        case 25..<30: return "Overweight"
        default: return "Obese"
        }
    }

    var categoryColor: Color {
        switch category {
        case "Underweight": return .blue
        case "Normal": return .green
        case "Overweight": return .orange
        case "Obese": return .red
        default: return .secondary
        }
    }

    var healthTip: String {
        switch category {
        case "Underweight":
            return "Consider consulting a dietitian. Focus on nutrient-dense foods and strength training."
        case "Normal":
            return "Great job! Maintain your healthy lifestyle with balanced nutrition and regular activity."
        case "Overweight":
            return "A modest reduction in calorie intake and regular cardio exercise can help reach a healthy weight."
        case "Obese":
            return "Speaking with a healthcare provider is recommended for a personalised weight-management plan."
        default:
            return ""
        }
    }

    // MARK: - Actions

    func calculate() {
        errorMessage = ""

        switch unitSystem {
        case .metric:
            guard let h = Double(heightCmText), h > 0 else {
                errorMessage = "Please enter a valid height in centimeters."
                return
            }
            guard let w = Double(weightKgText), w > 0 else {
                errorMessage = "Please enter a valid weight in kilograms."
                return
            }

        case .imperial:
            let feet = Double(heightFeetText) ?? 0
            let inches = Double(heightInchesText) ?? 0
            guard feet > 0 || inches > 0 else {
                errorMessage = "Please enter a valid height (feet and/or inches)."
                return
            }
            guard let w = Double(weightLbsText), w > 0 else {
                errorMessage = "Please enter a valid weight in pounds."
                return
            }
        }
    }

    func reset() {
        heightCmText = ""
        weightKgText = ""
        heightFeetText = ""
        heightInchesText = ""
        weightLbsText = ""
        errorMessage = ""
    }
}
