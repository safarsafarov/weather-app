//
//  WeatherList.swift
//  WeatherApp
//
//  Created by Safar Safarov on 19/12/22.
//

import SwiftUI


struct WeatherList: View {
  @ObservedObject var viewModel: WeatherListViewModel

  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.cities) { city in
          NavigationLink(destination: WeatherDetail(city: city.city)) {
            CityWeatherView(viewModel: city)
          }
        }
      }
      .navigationBarTitle("Weather")
    }
  }
}


struct WeatherList_Previews: PreviewProvider {
    static var previews: some View {
        WeatherList(viewModel: WeatherListViewModel())
    }
}
