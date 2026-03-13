//
//  FavoriteConversion.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//
import Foundation

struct FavoriteConversion: Identifiable, Codable {
    var id = UUID()
    let category: String
    let fromUnit: String
    let toUnit: String
}
