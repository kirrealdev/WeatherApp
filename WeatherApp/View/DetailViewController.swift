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
    @IBOutlet weak var detailWindSpeedLabel: UILabel!
    @IBOutlet weak var detailHumidityLabel: UILabel!
    @IBOutlet weak var detailPressureLabel: UILabel!
    @IBOutlet weak var detailMaxTempLabel: UILabel!
    @IBOutlet weak var delailMeanTempLabel: UILabel!
    @IBOutlet weak var detailMinTempLabel: UILabel!
    
    
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
        detailTempLabel.text = String((weather?.fact.temp)!) + " " + getConditionEmoju(condition: weather?.fact.condition ?? Condition.err)
        // MARK: - left column
        detailWindSpeedLabel.text = "💨" + " " + String((weather?.fact.windSpeed)!) + " " + "m/s"
        detailHumidityLabel.text = "💧" + " " + String((weather?.fact.humidity)!) + " " + "%"
        detailPressureLabel.text = "🧭" + " " + String((weather?.fact.pressureMm)!) + " " + "mm"
        // MARK: - left column
        detailMaxTempLabel.text = "⬆️" + "  " + String((weather?.forecasts[0].parts.day.tempMax)!) + " " + "°С"
        delailMeanTempLabel.text = "🔃" + "  " + String((weather?.forecasts[0].parts.day.tempAvg)!) + " " + "°С"
        detailMinTempLabel.text = "⬇️" + "  " + String((weather?.forecasts[0].parts.day.tempMin)!) + " " + "°С"
        
        
    }
    
}
