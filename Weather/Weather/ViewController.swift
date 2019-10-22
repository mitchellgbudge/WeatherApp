//
//  ViewController.swift
//  Weather
//
//  Created by Mitchell Budge on 10/22/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var liveImage: UIImageView!
    
    private var viewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getWeatherData { [weak self] weatherData in
            self?.temperatureLabel.text = weatherData.temperature
            self?.speedLabel.text = weatherData.wind
            
            let imageURL = URL(string: weatherData.liveImageURL)!
            self?.liveImage.kf.setImage(with: imageURL, options: [.forceRefresh])
        }
    }


}

