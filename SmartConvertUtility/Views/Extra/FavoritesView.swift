//
//  FavoritesView.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var appData: AppDataViewModel

    var body: some View {
        List {
            if appData.favorites.isEmpty {
                Text("No favorite conversions yet.")
                    .foregroundStyle(.secondary)
            } else {
                ForEach(appData.favorites) { favorite in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(favorite.category)
                            .font(.headline)
                        Text("\(favorite.fromUnit) → \(favorite.toUnit)")
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .navigationTitle("Favorites")
    }
}
