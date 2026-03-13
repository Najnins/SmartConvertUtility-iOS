//
//  Untitled.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import SwiftUI

struct GPAView: View {
    @StateObject private var viewModel = GPAViewModel()

    var body: some View {
        Form {
            Section("Add Course") {
                TextField("Grade Point (e.g. 4.0)", text: $viewModel.gradeText)
                    .keyboardType(.decimalPad)

                TextField("Credit Hours", text: $viewModel.creditText)
                    .keyboardType(.decimalPad)

                Button("Add Course") {
                    viewModel.addCourse()
                }
            }

            Section("Courses") {
                if viewModel.courses.isEmpty {
                    Text("No courses added yet")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(viewModel.courses) { course in
                        VStack(alignment: .leading) {
                            Text("Grade: \(course.grade, specifier: "%.2f")")
                            Text("Credits: \(course.creditHours, specifier: "%.1f")")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }

            Section("Result") {
                Text("GPA: \(viewModel.gpa, specifier: "%.2f")")
                    .font(.title2.bold())

                Button("Reset") {
                    viewModel.reset()
                }
                .foregroundStyle(.red)
            }
        }
        .navigationTitle("GPA Calculator")
    }
}
