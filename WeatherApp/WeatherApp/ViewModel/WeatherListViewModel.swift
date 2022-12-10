//
//  WeatherListViewModel.swift
//  WeatherApp
//
//  Created by Safar Safarov on 19/12/22.
//

import SwiftUI

class WeatherListViewModel: ObservableObject {
  @Published var cities: [CityWeatherViewModel] = []

  func fetchWeather() {
    cities = [
      CityWeatherViewModel(city: "San Francisco"),
      CityWeatherViewModel(city: "New York"),
      CityWeatherViewModel(city: "London"),
      CityWeatherViewModel(city: "Paris"),
      CityWeatherViewModel(city: "Tokyo"),
    ]
  }
}
