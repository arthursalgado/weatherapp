//
//  Weather.swift
//  WeatherApp
//
//  Created by Arthur Azevedo Salgado (P) on 10/09/22.
//

import ObjectMapper
import UIKit

struct WeatherResponse: Decodable, Mappable {
    var coord: Coord?
    var weather: [Weather]?
    var base: String?
    var main: Main?
    var visibility: Int?
    var wind: Wind?
    var clouds: Clouds?
    var dt: Int?
    var sys: Sys?
    var timezone: Int?
    var id: Int?
    var name: String?
    var cod: Int?
    
    init?(map: Map) {}
    
    internal init(coord: Coord?,
                  weather: [Weather]?,
                  base: String?,
                  main: Main?,
                  visibility: Int?,
                  wind: Wind?,
                  clouds: Clouds?,
                  dt: Int?,
                  sys: Sys?,
                  timezone: Int?,
                  id: Int?,
                  name: String?,
                  cod: Int?) {
        self.coord      = coord
        self.weather    = weather
        self.base       = base
        self.main       = main
        self.visibility = visibility
        self.wind       = wind
        self.clouds     = clouds
        self.dt         = dt
        self.sys        = sys
        self.timezone   = timezone
        self.id         = id
        self.name       = name
        self.cod        = cod
    }
    
    mutating func mapping(map: Map) {
        coord      <- map["coord"]
        weather    <- map["weather"]
        base       <- map["base"]
        main       <- map["main"]
        visibility <- map["visibility"]
        wind       <- map["wind"]
        clouds     <- map["clouds"]
        dt         <- map["dt"]
        sys        <- map["sys"]
        timezone   <- map["timezone"]
        id         <- map["id"]
        name       <- map["name"]
        cod        <- map["cod"]
    }
    
}

struct Coord: Decodable, Mappable {
    var lon: Double?
    var lat: Double?
    
    init?(map: Map) {}
    
    internal init(lon: Double?,
                  lat: Double?) {
        self.lon = lon
        self.lat = lat
    }
    
    mutating func mapping(map: Map) {
        lon <- map["lon"]
        lat <- map["lat"]
    }
}

struct Weather: Decodable, Mappable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
    
    init?(map: Map) {}
    
    internal init(id: Int?,
                  main: String?,
                  description: String?,
                  icon: String?) {
        self.id          = id
        self.main        = main
        self.description = description
        self.icon        = icon
    }
    
    mutating func mapping(map: Map) {
        id          <- map["id"]
        main        <- map["main"]
        description <- map["description"]
        icon        <- map["icon"]
    }
}

struct Main: Decodable, Mappable {
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Int?
    var humidity: Int?
    
    init?(map: Map) {}
    
    internal init(temp: Double?,
                  feels_like: Double?,
                  temp_min: Double?,
                  temp_max: Double?,
                  pressure: Int?,
                  humidity: Int?) {
        self.temp       = temp
        self.feels_like = feels_like
        self.temp_min   = temp_min
        self.temp_max   = temp_max
        self.pressure   = pressure
        self.humidity   = humidity
    }
    
    mutating func mapping(map: Map) {
        temp       <- map["temp"]
        feels_like <- map["feels_like"]
        temp_min   <- map["temp_min"]
        temp_max   <- map["temp_max"]
        pressure   <- map["pressure"]
        humidity   <- map["humidity"]
    }
}

struct Wind: Decodable, Mappable {
    var speed: Double?
    var deg: Int?
    
    init?(map: Map) {}
    
    internal init(speed: Double?,
                  deg: Int?) {
        self.speed = speed
        self.deg   = deg
    }
    
    mutating func mapping(map: Map) {
        speed <- map["speed"]
        deg   <- map["deg"]
    }
}

struct Clouds: Decodable, Mappable {
    var all: Int?
    
    init?(map: Map) {}
    
    internal init(all: Int?) {
        self.all = all
    }
    
    mutating func mapping(map: Map) {
        all <- map["all"]
    }
}

struct Sys: Decodable, Mappable {
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Int?
    var sunset: Int?
    
    init?(map: Map) {}
    
    internal init(type: Int?,
                  id: Int?,
                  country: String?,
                  sunrise: Int?,
                  sunset: Int?) {
        self.type    = type
        self.id      = id
        self.country = country
        self.sunrise = sunrise
        self.sunset  = sunset
    }
    
    mutating func mapping(map: Map) {
        type    <- map["type"]
        id      <- map["id"]
        country <- map["country"]
        sunrise <- map["sunrise"]
        sunset  <- map["sunset"]
    }
}
