//
//  AppDataViewModel.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import Foundation
import Combine

final class AppDataViewModel: ObservableObject {
    @Published var favorites: [FavoriteConversion] = [] {
        didSet { saveFavorites() }
    }
    @Published var history: [ConversionRecord] = [] {
        didSet { saveHistory() }
    }

    private let favoritesKey = "favorite_conversions"
    private let historyKey = "conversion_history"

    init() {
        loadFavorites()
        loadHistory()
    }

    func addFavorite(_ favorite: FavoriteConversion) {
        let alreadyExists = favorites.contains {
            $0.category == favorite.category &&
            $0.fromUnit == favorite.fromUnit &&
            $0.toUnit == favorite.toUnit
        }

        guard !alreadyExists else { return }
        favorites.append(favorite)
    }

    func addHistory(_ record: ConversionRecord) {
        if let latestRecord = history.first,
           latestRecord.category == record.category,
           latestRecord.inputValue == record.inputValue,
           latestRecord.fromUnit == record.fromUnit,
           latestRecord.toUnit == record.toUnit,
           latestRecord.result == record.result {
            return
        }

        history.insert(record, at: 0)
    }

    private func saveFavorites() {
        guard let data = try? JSONEncoder().encode(favorites) else { return }
        UserDefaults.standard.set(data, forKey: favoritesKey)
    }

    private func saveHistory() {
        guard let data = try? JSONEncoder().encode(history) else { return }
        UserDefaults.standard.set(data, forKey: historyKey)
    }

    private func loadFavorites() {
        guard let data = UserDefaults.standard.data(forKey: favoritesKey),
              let savedFavorites = try? JSONDecoder().decode([FavoriteConversion].self, from: data) else {
            return
        }

        favorites = savedFavorites
    }

    private func loadHistory() {
        guard let data = UserDefaults.standard.data(forKey: historyKey),
              let savedHistory = try? JSONDecoder().decode([ConversionRecord].self, from: data) else {
            return
        }

        history = savedHistory
    }
}
