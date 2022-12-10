//
//  WeatherDetailRow.swift
//  WeatherApp
//
//  Created by Safar Safarov on 19/12/22.
//

import SwiftUI

struct WeatherDetailRow: View {
  let title: String
  let value: String

  var body: some View {
    HStack {
      Text(title)
        .font(.subheadline)
        .foregroundColor(.gray)
      Spacer()
      Text(value)
        .font(.subheadline)
    }
  }
}

