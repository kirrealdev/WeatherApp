//
//  Extensions.swift
//  WeatherApp
//
//  Created by KirRealDev on 17.02.2021.
//

import Foundation

func getConditionEmoju(condition: Condition) -> String {
    switch condition {
    case Condition.clear:   return "☀️"
    case Condition.cloudy:  return "☁️"
    case Condition.lightSnow:   return "🌨"
    case Condition.overcast:    return "🌦"
    case Condition.partlyCloudy:    return "🌥"
    case Condition.snow:    return "❄️"
    case Condition.err:     return "⚙️"
    }
}
