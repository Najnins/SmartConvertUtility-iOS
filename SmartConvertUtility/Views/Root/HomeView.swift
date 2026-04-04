//
//  HomeView.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                ScreenHeader(
                    title: "SmartConvertUtility",
                    subtitle: "Converters and student tools in one app"
                )

                Text("Converters")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)

                NavigationLink(destination: ConverterView()) {
                    SectionCard(title: "Unit Converter", icon: "arrow.left.arrow.right", color: .blue)
                }
                .buttonStyle(.plain)

                Text("Student Tools")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 8)

                NavigationLink(destination: GPAView()) {
                    SectionCard(title: "GPA Calculator", icon: "graduationcap.fill", color: .green)
                }
                .buttonStyle(.plain)

                NavigationLink(destination: BMIView()) {
                    SectionCard(title: "BMI Calculator", icon: "heart.text.square.fill", color: .pink)
                }
                .buttonStyle(.plain)

                NavigationLink(destination: TimeZoneConverterView()) {
                    SectionCard(title: "Time Zone Converter", icon: "globe", color: .orange)
                }
                .buttonStyle(.plain)

                NavigationLink(destination: StudyTimerView()) {
                    SectionCard(title: "Study Timer", icon: "timer", color: .purple)
                }
                .buttonStyle(.plain)
            }
            .padding()
        }
        .navigationTitle("Home")
    }
}
