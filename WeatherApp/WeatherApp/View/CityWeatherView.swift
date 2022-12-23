//
//  CityWeatherView.swift
//  WeatherApp
//
//  Created by Safar Safarov on 23/12/22.
//

import SwiftUI

struct CityWeatherView: View {
  let viewModel: CityWeatherViewModel

  var body: some View {
    HStack {
      Image(systemName: viewModel.iconName)
        .foregroundColor(.gray)

      VStack(alignment: .leading) {
        Text(viewModel.city)
          .font(.headline)
        Text("\(viewModel.temperature)°")
          .font(.subheadline)
      }
    }
  }
}

