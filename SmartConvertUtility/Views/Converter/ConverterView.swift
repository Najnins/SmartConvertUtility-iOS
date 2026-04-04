//
//  ConverterView.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import SwiftUI

struct ConverterView: View {
    @StateObject private var viewModel = ConverterViewModel()
    @EnvironmentObject var appData: AppDataViewModel

    var body: some View {
        Form {
            Section("Category") {
                Picker("Select Category", selection: $viewModel.selectedCategory) {
                    ForEach(ConversionCategory.allCases) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
            }

            Section("Input") {
                TextField("Enter value", text: $viewModel.inputValue)
                    .keyboardType(.decimalPad)

                Picker("From", selection: $viewModel.fromUnit) {
                    ForEach(viewModel.selectedCategory.units, id: \.self) { unit in
                        Text(unit)
                    }
                }

                Picker("To", selection: $viewModel.toUnit) {
                    ForEach(viewModel.selectedCategory.units, id: \.self) { unit in
                        Text(unit)
                    }
                }

                Button("Swap Units") {
                    viewModel.swapUnits()
                }

                Button("Convert") {
                    if let _ = viewModel.convert() {
                        let record = ConversionRecord(
                            category: viewModel.selectedCategory.rawValue,
                            inputValue: viewModel.inputValue,
                            fromUnit: viewModel.fromUnit,
                            toUnit: viewModel.toUnit,
                            result: viewModel.resultText,
                            date: Date()
                        )
                        appData.addHistory(record)
                    }
                }
            }

            Section("Result") {
                Text(viewModel.resultText.isEmpty ? "No result yet" : viewModel.resultText)
                    .font(.title3.bold())

                Button("Save to Favorites") {
                    let favorite = FavoriteConversion(
                        category: viewModel.selectedCategory.rawValue,
                        fromUnit: viewModel.fromUnit,
                        toUnit: viewModel.toUnit
                    )
                    appData.addFavorite(favorite)
                }
            }
        }
        .navigationTitle("Converter")
    }
}
