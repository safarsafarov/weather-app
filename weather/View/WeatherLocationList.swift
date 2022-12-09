//
//  WeatherLocationView.swift
//  weather
//
//  Created by Safar Safarov on 07/12/22.
//
import CoreLocation
import SwiftUI



struct WeatherLocationList: View {
    @State var searchQuery = ""
    @State var location: String = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter your location", text: $location).textFieldStyle(RoundedBorderTextFieldStyle())
                    Button {
                        getWeatherForecast(for: location)
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.title3)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("Weather")
            .searchable(text: $location){
                
            }
            .onChange(of: location) { location in
                
            }
        }
    }
    func getWeatherForecast(for location: String) {
        let apiService = APIService.shared
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM, d"
        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let lat = placemarks?.first?.location?.coordinate.latitude,
               let lon = placemarks?.first?.location?.coordinate.longitude {
                // Don't forget to use your own key
                apiService.getJSON(urlString: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=current,minutely,hourly,alerts&appid=62edaf83d8f92b71c0c6e66b49f9f099",
                                   dateDecodingStrategy: .secondsSince1970) { (result: Result<Forecast,APIService.APIError>) in
                    switch result {
                    case .success(let forecast):
                        for day in forecast.daily {
                            print(dateFormatter.string(from: day.dt))
                            print("   Max: ", day.temp.max)
                            print("   Min: ", day.temp.min)
                            print("   Humidity: ", day.humidity)
                            print("   Description: ", day.weather[0].description)
                            print("   Clouds: ", day.clouds)
                            print("   pop: ", day.pop)
                            print("   IconURL: ", day.weather[0].weatherIconURL)
                        }
                    case .failure(let apiError):
                        switch apiError {
                        case .error(let errorString):
                            print(errorString)
                        }
                    }
                }
            }
        }
    }
}

struct WeatherLocationList_Previews: PreviewProvider {
    static var previews: some View {
        WeatherLocationList()
    }
}
