//
//  MainTableViewController.swift
//  WeatherApp
//
//  Created by KirRealDev on 16.02.2021.
//

import UIKit

protocol MainTableViewDelegate: class {
    
    func updateWeatherInformation(nameOfCurrCity: String, currWeather: WeatherData)
}

class MainTableViewController: UITableViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var mainTableView: UITableView!
    let mainSearchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Delegate
    weak var delegate: MainTableViewDelegate?
    
    // MARK: - Data containers
    let standartArrOfCities: [String] = ["Москва", "Стамбул", "Лондон", "Санкт-Петербург", "Берлин", "Мадрид", "Киев", "Рим", "Париж", "Минск"]
    var currArrOfCities: [String] = []
    var dictOfcurrCitiesData: [String: WeatherData] = [:]
    
    // MARK: - init methods
    func initSearchBar() {
        
        navigationItem.searchController = mainSearchController
        navigationItem.hidesSearchBarWhenScrolling = false
        mainSearchController.searchBar.placeholder = "Enter city name"
        mainSearchController.obscuresBackgroundDuringPresentation = false
        mainSearchController.searchBar.delegate = self
    }
    
    // MARK: - get data from the Network
    func getCitiesWeather() {
        
        let locationService = LocationService()
        locationService.requestWeatherForLocation(citiesData: self.currArrOfCities, onComplete: { (cityName, weather) in
            
            self.dictOfcurrCitiesData[cityName] = weather
    
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        })
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.currArrOfCities = self.standartArrOfCities
        getCitiesWeather()
        initSearchBar()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currArrOfCities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherMainTableViewCell", for: indexPath) as! WeatherMainTableViewCell
        cell.cityNameLabel.text = self.currArrOfCities[indexPath.row]
        let tmpCondition = getConditionEmoju(condition: self.dictOfcurrCitiesData[self.currArrOfCities[indexPath.row]]?.fact.condition ?? Condition.err)
        cell.currCityConditionLabel.text = tmpCondition
        let tmpTemp = String(self.dictOfcurrCitiesData[self.currArrOfCities[indexPath.row]]?.fact.temp ?? 0)
        cell.currCityTempLabel.text = tmpTemp + " " + "°С"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (self.dictOfcurrCitiesData[self.currArrOfCities[indexPath.row]] != nil) {
        
            let detailVC = storyboard?.instantiateViewController(identifier: "detailViewController") as! DetailViewController
            self.delegate = detailVC
            self.delegate?.updateWeatherInformation(nameOfCurrCity: self.currArrOfCities[indexPath.row], currWeather: dictOfcurrCitiesData[self.currArrOfCities[indexPath.row]]!)
            detailVC.modalPresentationStyle = .overFullScreen
            present(detailVC, animated: true, completion: nil)
        }
    }


}

//MARK: - SearchBarDelegate
extension MainTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            self.currArrOfCities = self.standartArrOfCities
            self.mainTableView.reloadData()
        }
        else {
            self.currArrOfCities = ["\(searchText)"]
            getCitiesWeather()
            self.mainTableView.reloadData()
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

        self.currArrOfCities = self.standartArrOfCities
        self.mainTableView.reloadData()
        
    }
}

