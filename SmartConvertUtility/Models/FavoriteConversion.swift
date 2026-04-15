//
//  FavoriteConversion.swift
//  SmartConvertUtility
//
//  Created by Najnin on 2026-03-13.
//  Najnin Sultana- Student ID # 101336862
//
import Foundation

struct FavoriteConversion: Identifiable, Codable {
    var id = UUID()
    let category: String
    let fromUnit: String
    let toUnit: String
}
