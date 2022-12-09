//
//  WeatherModel.swift
//  weather
//
//  Created by Safar Safarov on 09/12/22.
//

import Foundation

struct Weather: Codable {
    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }

    struct Main: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Int
        let humidity: Int
    }

    struct Wind: Codable {
        let speed: Double
        let deg: Double
    }

    struct Clouds: Codable {
        let all: Int
    }

    struct Sys: Codable {
        let type: Int
        let id: Int
        let country: String
        let sunrise: Int
        let sunset: Int
    }

    let weather: [Weather]
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let sys: Sys
    let name: String
}
