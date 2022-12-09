//
//  WeatherParameters.swift
//  weather
//
//  Created by Safar Safarov on 08/12/22.
//
import Foundation
import SwiftUI



struct WeatherLocationCities: Identifiable {
    var id = UUID()
    let country: String
    let city: String
    let weather: String
//    let image: Image
    
}


//var gg = [
//    WeatherLocationCities(country: "Poland", city: "Warsaw"),
//    WeatherLocationCities(country: "Romania", city: "Bucharest", weather: "21°"),
//    WeatherLocationCities(country: "Armenia", city: "Martuni", weather: "23°"),
//    WeatherLocationCities(country: "Malaysia", city: "Shah Alam", weather: "15°"),
//    WeatherLocationCities(country: "Germany", city: "Munich", weather: "10°"),
//    WeatherLocationCities(country: "Israel", city: "Netivot", weather: "12°"),
//    WeatherLocationCities(country: "Bolivia", city: "Santa Cruz de la Sierra", weather: "5°"),
//    WeatherLocationCities(country: "Brazil", city: "Porto Alegre", weather: "3°"),
//    WeatherLocationCities(country: "Israel", city: "Kfar Yona", weather: "3°"),
//    WeatherLocationCities(country: "Italy", city: "Palermo", weather: "3°"),
//    WeatherLocationCities(country: "Germany", city: "Bremen", weather: "3°"),
//    WeatherLocationCities(country: "Armenia", city: "Jermuk", weather: "3°"),
//    WeatherLocationCities(country: "Israel", city: "Beit Shemesh", weather: "3°"),
//    WeatherLocationCities(country: "Italy", city: "Florence", weather: "3°"),
//    WeatherLocationCities(country: "Netherlands", city: "Utrecht", weather: "3°"),
//    WeatherLocationCities(country: "Argentina", city: "Buenos Aires", weather: "3°"),
//    WeatherLocationCities(country: "Ecuador", city: "Guayaquil", weather: "3°"),
//    WeatherLocationCities(country: "Argentine", city: "Rosario", weather: "3°"),
//    WeatherLocationCities(country: "USA", city: "Soledad", weather: "3°"),
//    WeatherLocationCities(country: "Malaysia", city: "Subang Jaya", weather: "3°"),
//    WeatherLocationCities(country: "Spain", city: "Valencia", weather: "3°"),
//    WeatherLocationCities(country: "Malaysia", city: "Pasir Gudang", weather: "3°"),
//    WeatherLocationCities(country: "Armenia", city: "Akhtala", weather: "3°"),
//    WeatherLocationCities(country: "Hungary", city: "Budapest", weather: "3°")
//]
