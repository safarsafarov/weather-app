//
//  WeatherLocationView.swift
//  weather
//
//  Created by Safar Safarov on 07/12/22.
//
import CoreLocation
import SwiftUI



struct WeatherLocationList: View {
    @State private var location: String = ""
    @State var forecast: Forecast? = nil
    let dateFormatter = DateFormatter()
    init() {
        dateFormatter.dateFormat = "E, MMM, d"
    }
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
                if let forecast = forecast {
                    List(forecast.daily, id: \.dt) { day in
                        VStack(alignment: .leading) {
                            Text(dateFormatter.string(from: day.dt))
                                .fontWeight(.bold)
                            HStack(alignment: .top) {
                                Image(systemName: "hourglass")
                                    .font(.title)
                                    .frame(width: 50, height: 50)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                                VStack(alignment: .leading) {
                                    Text(day.weather[0].description.capitalized)
                                    HStack {
                                        Text("High: \(day.temp.max, specifier: "%.0f")")
                                        Text("Low: \(day.temp.min, specifier: "%.0f")")
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                } else {
                    Spacer()
                }
                
            }
            .padding(.horizontal)
            .navigationTitle("Weather")
//            .searchable(text: forecast){
//
//            }
//            .onChange(of: forecast) { forecast in
//
//            }
        }
    }
    func getWeatherForecast(for location: String) {
        let apiService = APIService.shared
        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let lat = placemarks?.first?.location?.coordinate.latitude,
               let lon = placemarks?.first?.location?.coordinate.longitude {
                // Don't forget to use your own key
                        apiService.getJSON(urlString: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=current,minutely,hourly,alerts&appid={}",
                                   dateDecodingStrategy: .secondsSince1970) { (result: Result<Forecast,APIService.APIError>) in
                            switch result {
                            case .success(let forecast):
                                self.forecast = forecast
        //                        for day in forecast.daily {
        //                            print(dateFormatter.string(from: day.dt))
        //                            print("   Max: ", day.temp.max)
        //                            print("   Min: ", day.temp.min)
        //                            print("   Humidity: ", day.humidity)
        //                            print("   Description: ", day.weather[0].description)
        //                            print("   Clouds: ", day.clouds)
        //                            print("   pop: ", day.pop)
        //                            print("   IconURL: ", day.weather[0].weatherIconURL)
        //                        }
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
