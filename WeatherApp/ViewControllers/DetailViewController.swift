//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by KirRealDev on 16.02.2021.
//

import UIKit

class DetailViewController: UIViewController, MainTableViewDelegate, UITableViewDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var detailNameCityLabel: UILabel!
    @IBOutlet weak var detailTempLabel: UILabel!
    @IBOutlet weak var detailWindSpeedLabel: UILabel!
    @IBOutlet weak var detailHumidityLabel: UILabel!
    @IBOutlet weak var detailPressureLabel: UILabel!
    
    @IBOutlet weak var detailMaxTempLabel: UILabel!
    @IBOutlet weak var delailMeanTempLabel: UILabel!
    @IBOutlet weak var detailMinTempLabel: UILabel!
    
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var detailTableDateLabel: UILabel!
    @IBOutlet weak var detailTableMinTempLabel: UILabel!
    @IBOutlet weak var detailTableMaxTempLabel: UILabel!
    
    
    @IBAction func pushCancelButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Data containers
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
        
        detailNameCityLabel.text = String((weather?.forecasts[0].date)!) + ", " + (nameOfCity)!
        detailTempLabel.text = String((weather?.fact.temp)!) + " " + getConditionEmoju(condition: weather?.fact.condition ?? Condition.err)
        // MARK: - left column
        detailWindSpeedLabel.text = "💨" + " " + String((weather?.fact.windSpeed)!) + " " + "m/s"
        detailHumidityLabel.text = "💧" + " " + String((weather?.fact.humidity)!) + " " + "%"
        detailPressureLabel.text = "🧭" + " " + String((weather?.fact.pressureMm)!) + " " + "mm"
    
        // MARK: - left column (today weather)
        detailMaxTempLabel.text = "⬆️" + "  " + String((weather?.forecasts[0].parts.day.tempMax)!) + " " + "°С"
        delailMeanTempLabel.text = "↕️" + "  " + String((weather?.forecasts[0].parts.day.tempAvg)!) + " " + "°С"
        detailMinTempLabel.text = "⬇️" + "  " + String((weather?.forecasts[0].parts.day.tempMin)!) + " " + "°С"
    }
    
}

// MARK: - Table view data source
extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (weather?.forecasts.count ?? 0) - 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailDayWeatherData", for: indexPath) as! DetailDayWeatherViewCell
            cell.detailTableDateLabel?.text = String((weather?.forecasts[1].date)!)
            cell.detailTableMinTempLabel?.text = "min" + " " + String((weather?.forecasts[1].parts.day.tempMin)!) + " " + "°С"
            cell.detailTableMaxTempLabel?.text = "max" + " " + String((weather?.forecasts[1].parts.day.tempMax)!) + " " + "°С"
            
            return cell
        }
        else if(indexPath.row == 1) {
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailDayWeatherData", for: indexPath) as! DetailDayWeatherViewCell
            cell.detailTableDateLabel?.text = String((weather?.forecasts[2].date)!)
            cell.detailTableMinTempLabel?.text = "min" + " " + String((weather?.forecasts[2].parts.day.tempMin)!) + " " + "°С"
            cell.detailTableMaxTempLabel?.text = "max" + " " + String((weather?.forecasts[2].parts.day.tempMax)!) + " " + "°С"
            
            return cell
        }
        else if(indexPath.row == 2) {
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailDayWeatherData", for: indexPath) as! DetailDayWeatherViewCell
            cell.detailTableDateLabel?.text = String((weather?.forecasts[3].date)!)
            cell.detailTableMinTempLabel?.text = "min" + " " + String((weather?.forecasts[3].parts.day.tempMin)!) + " " + "°С"
            cell.detailTableMaxTempLabel?.text = "max" + " " + String((weather?.forecasts[3].parts.day.tempMax)!) + " " + "°С"
            
            return cell
        }
        else if(indexPath.row == 3) {
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailDayWeatherData", for: indexPath) as! DetailDayWeatherViewCell
            cell.detailTableDateLabel?.text = String((weather?.forecasts[4].date)!)
            cell.detailTableMinTempLabel?.text = "min" + " " + String((weather?.forecasts[4].parts.day.tempMin)!) + " " + "°С"
            cell.detailTableMaxTempLabel?.text = "max" + " " + String((weather?.forecasts[4].parts.day.tempMax)!) + " " + "°С"
            
            return cell
        }
        else if(indexPath.row == 4) {
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailDayWeatherData", for: indexPath) as! DetailDayWeatherViewCell
            cell.detailTableDateLabel?.text = String((weather?.forecasts[5].date)!)
            cell.detailTableMinTempLabel?.text = "min" + " " + String((weather?.forecasts[5].parts.day.tempMin)!) + " " + "°С"
            cell.detailTableMaxTempLabel?.text = "max" + " " + String((weather?.forecasts[5].parts.day.tempMax)!) + " " + "°С"
            
            return cell
        }
        else {
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailDayWeatherData", for: indexPath) as! DetailDayWeatherViewCell
            cell.detailTableDateLabel?.text = String((weather?.forecasts[6].date)!)
            cell.detailTableMinTempLabel?.text = "min" + " " + String((weather?.forecasts[6].parts.day.tempMin)!) + " " + "°С"
            cell.detailTableMaxTempLabel?.text = "max" + " " + String((weather?.forecasts[6].parts.day.tempMax)!) + " " + "°С"
            
            return cell
        }
    }
    
}
