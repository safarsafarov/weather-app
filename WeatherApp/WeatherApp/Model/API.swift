//
//  API.swift
//  WeatherApp
//
//  Created by Safar Safarov on 23/12/22.
//

import Foundation

class API {
  static let shared = API()

  private let baseURL = "https://api.openweathermap.org/data/2.5"
  private let apiKey = "62edaf83d8f92b71c0c6e66b49f9f099"

  func fetchWeather(for city: String, completion: @escaping (Result<Weather, Error>) -> Void) {
    let escapedCity = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? city
    let urlString = "\(baseURL)/weather?q=\(escapedCity)&units=metric&appid=\(apiKey)"
    guard let url = URL(string: urlString) else { return }

    URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        completion(.failure(error))
        return
      }

      guard let data = data else {
        let error = NSError(domain: "com.example.WeatherApp", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data was not retrieved from the request"])
        completion(.failure(error))
        return
      }

      do {
        let weather = try JSONDecoder().decode(Weather.self, from: data)
        completion(.success(weather))
      } catch {
        completion(.failure(error))
      }
    }.resume()
  }
}

