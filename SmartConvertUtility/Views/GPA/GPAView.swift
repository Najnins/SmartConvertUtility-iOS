//
//  Untitled.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import SwiftUI

struct GPAView: View {
    @StateObject private var viewModel = GPAViewModel()
    @FocusState private var fieldFocused: Bool

    var body: some View {
        Form {
            Section("Add Course") {
                TextField("Course Name (e.g. COMP2139)", text: $viewModel.courseNameText)
                    .focused($fieldFocused)

                TextField("Grade Point (e.g. 4.0)", text: $viewModel.gradeText)
                    .keyboardType(.decimalPad)
                    .focused($fieldFocused)

                TextField("Credit Hours", text: $viewModel.creditText)
                    .keyboardType(.decimalPad)
                    .focused($fieldFocused)

                Button("Add Course") {
                    fieldFocused = false
                    viewModel.addCourse()
                }

                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                        .font(.caption)
                }
            }

            Section("Courses") {
                if viewModel.courses.isEmpty {
                    Text("No courses added yet")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(viewModel.courses) { course in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(course.name)
                                .font(.headline)

                            Text("Grade: \(course.grade, specifier: "%.2f")")
                            Text("Credits: \(course.creditHours, specifier: "%.1f")")
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
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

