//
//  SmartConvertUtilityApp.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//

import SwiftUI

@main
struct SmartConvertUtilityApp: App {

    @State private var showLaunch = true
    @StateObject private var appData = AppDataViewModel()

    var body: some Scene {
        WindowGroup {
            if showLaunch {
                LaunchView(showLaunch: $showLaunch)
                    .environmentObject(appData)
            } else {
                MainTabView(showLaunch: $showLaunch)
                    .environmentObject(appData)
            }
        }
    }
}
