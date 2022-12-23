//
//  LocationService.swift
//  WeatherApp
//
//  Created by Safar Safarov on 23/12/22.
//

import Foundation
import CoreLocation

class LocationService: NSObject {
  let manager = CLLocationManager()
  var currentLocation: CLLocation?

  override init() {
    super.init()
    manager.delegate = self
  }

  func requestLocation() {
    manager.requestWhenInUseAuthorization()
    manager.requestLocation()
  }

  func reverseGeocode(location: CLLocation, completion: @escaping (Result<String, Error>) -> Void) {
    CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
      if let error = error {
        completion(.failure(error))
        return
      }

      guard let placemark = placemarks?.first else {
        let error = NSError(domain: "com.example.WeatherApp", code: 0, userInfo: [NSLocalizedDescriptionKey: "No placemarks found"])
        completion(.failure(error))
        return
      }

      guard let city = placemark.locality else {
        let error = NSError(domain: "com.example.WeatherApp", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not find city"])
        completion(.failure(error))
        return
      }

      completion(.success(city))
    }
  }
}

extension LocationService: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else { return }
    currentLocation = location
  }

  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("Error getting location: \(error)")
  }
}
