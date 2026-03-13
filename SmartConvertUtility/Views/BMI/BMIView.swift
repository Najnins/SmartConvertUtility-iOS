//
//  BMIView.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import SwiftUI

struct BMIView: View {
    @StateObject private var viewModel = BMIViewModel()

    var body: some View {
        Form {
            Section("Input") {
                TextField("Height in cm", text: $viewModel.heightText)
                    .keyboardType(.decimalPad)

                TextField("Weight in kg", text: $viewModel.weightText)
                    .keyboardType(.decimalPad)
            }

            Section("Result") {
                Text("BMI: \(viewModel.bmiResult, specifier: "%.2f")")
                    .font(.title2.bold())
                Text("Category: \(viewModel.category)")
            }
        }
        .navigationTitle("BMI Calculator")
    }
}
