//
//  GPAViewModel.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import Foundation
import Combine

final class GPAViewModel: ObservableObject {
    @Published var courses: [Course] = []
    @Published var gradeText: String = ""
    @Published var creditText: String = ""

    var gpa: Double {
        let totalPoints = courses.reduce(0) { $0 + ($1.grade * $1.creditHours) }
        let totalCredits = courses.reduce(0) { $0 + $1.creditHours }
        guard totalCredits > 0 else { return 0.0 }
        return totalPoints / totalCredits
    }

    func addCourse() {
        guard let grade = Double(gradeText),
              let credits = Double(creditText),
              credits > 0 else { return }

        courses.append(Course(grade: grade, creditHours: credits))
        gradeText = ""
        creditText = ""
    }

    func reset() {
        courses.removeAll()
        gradeText = ""
        creditText = ""
    }
}
