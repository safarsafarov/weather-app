//
//  CityRow.swift
//  WeatherApp
//
//  Created by Safar Safarov on 19/12/22.
//

import SwiftUI
struct CityRow: View {
  let city: String
  let temperature: Double

  var body: some View {
    HStack {
      Image(systemName: "cloud.sun")
        .foregroundColor(.gray)
      Text(city)
        .font(.headline)
      Spacer()
      Text("\(temperature)°")
        .font(.subheadline)
    }
  }
}


