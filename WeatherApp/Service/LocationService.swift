//
//  LocationService.swift
//  WeatherApp
//
//  Created by KirRealDev on 17.02.2021.
//

import Foundation
import CoreLocation

struct LocationService {
    
    func getLocationFor(_ cityName: String, onComplete: @escaping(_ coodtinates: CLLocationCoordinate2D?, _ error: Error?) -> ()) {
        CLGeocoder().geocodeAddressString(cityName) {(placemark, error) in
            onComplete(placemark?.first?.location?.coordinate, error)
        }
    }
    
    func requestWeatherForLocation(citiesData: [String], onComplete:
                                    
        @escaping (String, WeatherData) -> Void) {
        
        let networkService = NetworkService()
        
        for cityName in citiesData {
            getLocationFor(cityName) { (coordinate, error) in
                guard let coordinate = coordinate, error == nil else { return }
                
                networkService.loadBasicWeatherDataByLocation(lat: coordinate.latitude, long: coordinate.longitude, onComplete: { (weather) in
                    onComplete(cityName, weather) } )
                { (error) in
                    NSLog(error.localizedDescription)
                }
                }
        }
        }

}
