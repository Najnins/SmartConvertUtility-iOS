//
//  AppDataViewModel.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import Foundation
import Combine

final class AppDataViewModel: ObservableObject {
    @Published var favorites: [FavoriteConversion] = []
    @Published var history: [ConversionRecord] = []

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
}
