//
//  TimeZoneConverterView.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import SwiftUI

struct TimeZoneConverterView: View {
    @StateObject private var viewModel = TimeZoneViewModel()

    var body: some View {
        Form {
            Section("Select Time Zones") {
                Picker("From", selection: $viewModel.selectedFrom) {
                    ForEach(viewModel.zones) { zone in
                        Text(zone.name).tag(zone)
                    }
                }

                Picker("To", selection: $viewModel.selectedTo) {
                    ForEach(viewModel.zones) { zone in
                        Text(zone.name).tag(zone)
                    }
                }
            }

            Section("Current Time") {
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(viewModel.selectedFrom.name):")
                        .font(.headline)
                    Text(viewModel.currentTime(for: viewModel.selectedFrom))

                    Text("\(viewModel.selectedTo.name):")
                        .font(.headline)
                        .padding(.top, 8)
                    Text(viewModel.currentTime(for: viewModel.selectedTo))
                }
            }
        }
        .navigationTitle("Time Zone")
    }
}
