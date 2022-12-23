//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Safar Safarov on 23/12/22.
//

import Foundation

class WeatherViewModel: ObservableObject {
  @Published var weather: Weather?

  private let city: String
  private let api: API

  init(city: String, api: API = API.shared) {
    self.city = city
    self.api = api
  }

  func fetchWeather() {
    api.fetchWeather(for: city) { [weak self] result in
      guard let self = self else { return }
      switch result {
      case .success(let weather):
        self.weather = weather
      case .failure(let error):
        print("Error fetching weather: \(error)")
      }
    }
  }
}
