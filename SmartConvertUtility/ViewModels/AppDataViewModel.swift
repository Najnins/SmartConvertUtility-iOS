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
        favorites.append(favorite)
    }

    func addHistory(_ record: ConversionRecord) {
        history.insert(record, at: 0)
    }
}
