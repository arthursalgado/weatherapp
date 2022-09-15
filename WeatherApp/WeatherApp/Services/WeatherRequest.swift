//
//  WeatherRequest.swift
//  WeatherApp
//
//  Created by Arthur Azevedo Salgado (P) on 10/09/22.
//

import Foundation

class WeatherRequest {
    
    var endpoint: String {
        get {
            return "http://api.openweathermap.org/data/2.5/weather?lat=34.0194704&lon=-118.4912273&appid=d4277b87ee5c71a468ec0c3dc311a724"
        }
    }
}
