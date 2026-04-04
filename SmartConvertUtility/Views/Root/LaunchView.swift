//
//  LaunchView.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import SwiftUI

struct LaunchView: View {
    @Binding var showLaunch: Bool

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundStyle(.blue)

            Text("SmartConvertUtility")
                .font(.largeTitle.bold())

            Text("All-in-One Conversion & Student Utility App")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding(.horizontal)

            Spacer()

            VStack(spacing: 6) {
                Text("Team Members")
                    .font(.headline)
                Text("Najnin Sultana")
                Text("Arad Tahmasebifar")
                Text("Shaheer Ansari")
                Text("Niaj Hossain")
            }

            Spacer()

            Button("Enter App") {
                withAnimation {
                    showLaunch = false
                }
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
    }
}
