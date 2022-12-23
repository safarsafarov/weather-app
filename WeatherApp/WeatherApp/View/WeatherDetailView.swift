//
//  WeatherDetailView.swift
//  WeatherApp
//
//  Created by Safar Safarov on 23/12/22.
//

import SwiftUI

struct WeatherDetailView: View {
  let viewModel: WeatherViewModel

  var body: some View {
    Form {
      if let weather = viewModel.weather {
        WeatherDetailRow(title: "Temperature", value: "\(weather.temperature)°")
        WeatherDetailRow(title: "Humidity", value: "\(weather.humidity)%")
        WeatherDetailRow(title: "Wind Speed", value: "\(weather.windSpeed) mph")
      }
    }
  }
}

//struct WeatherDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherDetailView()
//    }
//}
