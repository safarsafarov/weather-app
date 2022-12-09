//
//  WeatherViewModel.swift
//  weather
//
//  Created by Safar Safarov on 09/12/22.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    // Use the @Published property wrapper to automatically
    // send notifications when the weatherData property is updated
    @Published var weatherData = [Weather]()

    func fetchWeather() {
        // Call the API to fetch the weather data
        // and update the weatherData property
    }
}
