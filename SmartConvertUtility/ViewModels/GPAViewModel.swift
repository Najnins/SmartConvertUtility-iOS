//
//  GPAViewModel.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//  Najnin Sultana, Student ID # 101336862
//
import Foundation
import Combine

final class GPAViewModel: ObservableObject {
    @Published var courses: [Course] = []
    @Published var courseNameText: String = ""
    @Published var gradeText: String = ""
    @Published var creditText: String = ""
    @Published var errorMessage: String = ""

    var gpa: Double {
        let totalPoints = courses.reduce(0) { $0 + ($1.grade * $1.creditHours) }
        let totalCredits = courses.reduce(0) { $0 + $1.creditHours }
        guard totalCredits > 0 else { return 0.0 }
        return totalPoints / totalCredits
    }

    func addCourse() {
        let name = courseNameText.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedGrade = gradeText.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedCredit = creditText.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !name.isEmpty else {
            errorMessage = "Please enter course name."
            return
        }

        guard let grade = Double(trimmedGrade),
              let credits = Double(trimmedCredit) else {
            errorMessage = "Please enter valid numeric values."
            return
        }

        guard credits > 0 else {
            errorMessage = "Credit hours must be greater than 0."
            return
        }

        guard grade >= 0, grade <= 4.0 else {
            errorMessage = "Grade point must be between 0.0 and 4.0."
            return
        }

        courses.append(Course(name: name, grade: grade, creditHours: credits))

        courseNameText = ""
        gradeText = ""
        creditText = ""
        errorMessage = ""
    }

    func reset() {
        courses.removeAll()
        courseNameText = ""
        gradeText = ""
        creditText = ""
        errorMessage = ""
    }
}
