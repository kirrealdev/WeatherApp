//
//  BasicWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by KirRealDev on 16.02.2021.
//

import UIKit

class WeatherMainTableViewCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currCityTempLabel: UILabel!
    @IBOutlet weak var currCityConditionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
