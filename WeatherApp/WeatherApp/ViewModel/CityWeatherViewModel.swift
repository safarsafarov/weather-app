//
//  CityWeatherViewModel.swift
//  WeatherApp
//
//  Created by Safar Safarov on 23/12/22.
//

import Foundation

struct CityWeatherViewModel: Identifiable {
  let id = UUID()
  let city: String
  let temperature: Double
  let iconName: String

  init(city: String, temperature: Double = 0.0, iconName: String = "cloud.sun") {
    self.city = city
    self.temperature = temperature
    self.iconName = iconName
  }
}

