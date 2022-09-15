//
//  WAError.swift
//  WeatherApp
//
//  Created by Arthur Azevedo Salgado (P) on 10/09/22.
//

import Foundation

enum WAError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
