//
//  MainTabVIew.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import SwiftUI

struct MainTabView: View {

    @Binding var showLaunch: Bool

    var body: some View {
        TabView {

            NavigationStack {
                HomeView()
                    .toolbar {
                        Button("Restart") {
                            showLaunch = true
                        }
                    }
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }

            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock")
                }
        }
    }
}
