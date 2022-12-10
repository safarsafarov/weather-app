//
//  WeatherDetail.swift
//  WeatherApp
//
//  Created by Safar Safarov on 19/12/22.
//

import SwiftUI
struct WeatherDetail: View {
  @ObservedObject var viewModel: WeatherViewModel

  init(city: String) {
    viewModel = WeatherViewModel(city: city)
  }

  var body: some View {
    VStack {
      if viewModel.weather != nil {
        WeatherDetailView(viewModel: viewModel)
      } else {
        Text("Loading...")
      }
    }
    .onAppear(perform: viewModel.fetchWeather)
  }
}

