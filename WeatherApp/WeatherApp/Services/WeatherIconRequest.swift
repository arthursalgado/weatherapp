//
//  WeatherIconRequest.swift
//  WeatherApp
//
//  Created by Arthur Azevedo Salgado (P) on 10/09/22.
//

import Foundation

class WeatherIconRequest {
    
    let icon: String
    
    init(icon: String) {
        self.icon = icon
    }
    
    var endpoint: String {
        get {
            return "http://openweathermap.org/img/wn/\(icon)@2x.png"
        }
    }
}
