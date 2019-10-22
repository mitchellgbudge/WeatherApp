//
//  ViewController.swift
//  Weather
//
//  Created by Mitchell Budge on 10/22/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    private var viewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getWeatherData { [weak self] weatherData in
            self?.temperatureLabel.text = weatherData.temperature
            self?.speedLabel.text = weatherData.wind
        }
    }


}

