//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by KirRealDev on 16.02.2021.
//

import UIKit

class DetailViewController: UIViewController, MainTableViewDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var detailNameCityLabel: UILabel!
    @IBOutlet weak var detailTempLabel: UILabel!
    @IBAction func pushCancelButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - IBOutlets
    var nameOfCity: String? = nil
    var weather: WeatherData? = nil
    
    // MARK: - get information about the city from the Main Table View Controller
    func updateWeatherInformation(nameOfCurrCity: String, currWeather: WeatherData) {
        
        self.nameOfCity = nameOfCurrCity
        self.weather = currWeather
    }
    
    // MARK: - view Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailNameCityLabel.text = nameOfCity
        detailTempLabel.text = String((weather?.fact.temp)!)
    }
    
}
