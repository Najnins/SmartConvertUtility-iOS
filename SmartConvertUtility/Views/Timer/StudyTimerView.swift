//
//  StudyTimerView.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import SwiftUI

struct StudyTimerView: View {
    @StateObject private var viewModel = StudyTimerViewModel()

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Text("Pomodoro Study Timer")
                .font(.title.bold())

            Text(viewModel.formattedTime)
                .font(.system(size: 56, weight: .bold, design: .rounded))

            HStack(spacing: 16) {
                Button(viewModel.isRunning ? "Pause" : "Start") {
                    viewModel.startPause()
                }
                .buttonStyle(.borderedProminent)

                Button("Reset") {
                    viewModel.reset()
                }
                .buttonStyle(.bordered)
            }

            Text("Focus for 25 minutes, then take a short break.")
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()
        }
        .padding()
        .navigationTitle("Study Timer")
    }
}
