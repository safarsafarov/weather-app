//
//  WeatherLocationView.swift
//  weather
//
//  Created by Safar Safarov on 07/12/22.
//

import SwiftUI
import Foundation


struct WeatherLocationView: View {
    @State var searchQuery = ""
    var body: some View {
        NavigationView {
            
            List(locations) { locations in
                HStack {
                    VStack(alignment: .leading, spacing: 10.0) {
                        Text(locations.country)
                            .font(.system(size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(locations.city)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 25))
                            .fontWeight(.medium)
                    }
                    Image("w2")
                        .padding(.trailing, 50.0)
                        .frame(width: 50.0, height: 50.0)
                    
                    Spacer()
                    Text(locations.weather)
                        .font(.system(size: 50))
                        .fontWeight(.thin)
                        .multilineTextAlignment(.trailing)
                    
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Weather")
            .searchable(text: $searchQuery)
        }
    }
}

struct WeatherLocationView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherLocationView()
    }
}
