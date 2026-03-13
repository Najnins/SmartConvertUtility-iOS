//
//  StudyTimerViewModel.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import Foundation
import Combine

final class StudyTimerViewModel: ObservableObject {
    @Published var timeRemaining: Int = 25 * 60
    @Published var isRunning = false

    private var timer: AnyCancellable?

    var formattedTime: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func startPause() {
        isRunning.toggle()

        if isRunning {
            timer = Timer.publish(every: 1, on: .main, in: .common)
                .autoconnect()
                .sink { [weak self] _ in
                    guard let self else { return }
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    } else {
                        self.isRunning = false
                        self.timer?.cancel()
                    }
                }
        } else {
            timer?.cancel()
        }
    }

    func reset() {
        timer?.cancel()
        isRunning = false
        timeRemaining = 25 * 60
    }
}
