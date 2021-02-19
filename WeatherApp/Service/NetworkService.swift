//
//  NetworkService.swift
//  WeatherApp
//
//  Created by KirRealDev on 16.02.2021.
//

import Foundation

enum ServerError: Error {
    
    case noDataProvided
    case failedToDecode
}

struct NetworkService {
    
    // MARK: - Load Basic Weather Data by Location
    func loadBasicWeatherDataByLocation(lat: Double, long: Double, onComplete: @escaping (WeatherData) -> Void, onError: @escaping (Error) -> Void) {
        
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(lat)&lon=\(long)"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue(NetworkConstant.weatherAccessKey, forHTTPHeaderField: NetworkConstant.providerOfAccessKey)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                onError(error)
                return
            }
            guard let  data = data else {
                onError(ServerError.noDataProvided)
                return
            }
            
            guard let weather = try? JSONDecoder().decode(WeatherData.self, from: data) else {
                NSLog("Could not decode")
                onError(ServerError.failedToDecode)
                return
            }
            DispatchQueue.main.async {
                onComplete(weather)
            }
        }
        task.resume()
    }

}
