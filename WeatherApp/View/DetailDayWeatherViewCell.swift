//
//  DetailDayWeatherViewCell.swift
//  WeatherApp
//
//  Created by KirRealDev on 19.02.2021.
//

import UIKit

class DetailDayWeatherViewCell: UITableViewCell {

    @IBOutlet weak var detailTableDateLabel: UILabel!
    @IBOutlet weak var detailTableMinTempLabel: UILabel!
    @IBOutlet weak var detailTableMaxTempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
