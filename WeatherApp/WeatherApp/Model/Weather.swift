//
//  Weather.swift
//  WeatherApp
//
//  Created by Safar Safarov on 23/12/22.
//

import Foundation

struct Weather: Codable {
  let temperature: Double
  let highTemperature: Double
  let lowTemperature: Double
  let humidity: Int
  let windSpeed: Double
  let description: String

  private enum CodingKeys: String, CodingKey {
    case temperature = "temp"
    case highTemperature = "temp_max"
    case lowTemperature = "temp_min"
    case humidity
    case windSpeed = "wind_speed"
    case description
  }
}

