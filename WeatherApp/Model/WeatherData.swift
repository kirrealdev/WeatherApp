//
//  BasicWeatherDataModel.swift
//  WeatherApp
//
//  Created by KirRealDev on 16.02.2021.
//

import Foundation

struct WeatherData: Codable {
    
    let fact: Fact
    let forecasts: [Forecast]
}

struct Fact: Codable {
    
    let temp: Int
    let condition: Condition
    let windSpeed: Double
    let pressureMm: Int
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        
        case temp
        case condition
        case windSpeed = "wind_speed"
        case pressureMm = "pressure_mm"
        case humidity
    }
}

enum Condition: String, Codable {
    
    case clear = "clear"
    case cloudy = "cloudy"
    case lightSnow = "light-snow"
    case overcast = "overcast"
    case partlyCloudy = "partly-cloudy"
    case snow = "snow"
    case err = "err"
}


struct Forecast: Codable {
    
    let date: String
    let parts: Parts
}

struct Parts: Codable {
    
    let day: Hour
}

struct Hour: Codable {
    
    let tempMin, tempMax, tempAvg: Int?

    enum CodingKeys: String, CodingKey {
        
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case tempAvg = "temp_avg"
    }
}
