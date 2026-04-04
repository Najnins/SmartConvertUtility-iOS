//
//  BMIView.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import SwiftUI

struct BMIView: View {
    @StateObject private var viewModel = BMIViewModel()
    @FocusState private var fieldFocused: Bool

    var body: some View {
        Form {
            // MARK: Unit System
            Section("Unit System") {
                Picker("Units", selection: $viewModel.unitSystem) {
                    ForEach(BMIUnitSystem.allCases) { system in
                        Text(system.rawValue).tag(system)
                    }
                }
                .pickerStyle(.segmented)
                .onChange(of: viewModel.unitSystem) { _ in
                    viewModel.reset()
                }
            }

            // MARK: Input
            Section("Input") {
                if viewModel.unitSystem == .metric {
                    TextField("Height (cm)", text: $viewModel.heightCmText)
                        .keyboardType(.decimalPad)
                        .focused($fieldFocused)

                    TextField("Weight (kg)", text: $viewModel.weightKgText)
                        .keyboardType(.decimalPad)
                        .focused($fieldFocused)
                } else {
                    HStack {
                        TextField("Feet", text: $viewModel.heightFeetText)
                            .keyboardType(.numberPad)
                            .focused($fieldFocused)

                        Divider()

                        TextField("Inches", text: $viewModel.heightInchesText)
                            .keyboardType(.decimalPad)
                            .focused($fieldFocused)
                    }

                    TextField("Weight (lbs)", text: $viewModel.weightLbsText)
                        .keyboardType(.decimalPad)
                        .focused($fieldFocused)
                }

                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                        .font(.caption)
                }

                Button("Calculate") {
                    fieldFocused = false
                    viewModel.calculate()
                }
            }

            // MARK: Result
            if viewModel.bmiResult > 0 {
                Section("Result") {
                    HStack {
                        Text("BMI")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text(String(format: "%.1f", viewModel.bmiResult))
                            .font(.title2.bold())
                    }

                    HStack {
                        Text("Category")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text(viewModel.category)
                            .font(.headline)
                            .foregroundStyle(viewModel.categoryColor)
                    }

                    if !viewModel.healthTip.isEmpty {
                        Text(viewModel.healthTip)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .padding(.vertical, 4)
                    }
                }

                Section {
                    Button("Reset") {
                        fieldFocused = false
                        viewModel.reset()
                    }
                    .foregroundStyle(.red)
                }
            }
        }
        .navigationTitle("BMI Calculator")
    }
}
