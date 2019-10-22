//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Mitchell Budge on 10/22/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import Foundation
import TartuWeatherProvider

struct Weather {
    let temperature: String
    let wind: String
    let liveImageURL: String
}

struct WeatherViewModel {
    func getWeatherData(_ completion: @escaping (Weather) -> Void) {
        TartuWeatherProvider.getWeatherData { result in
            switch result {
            case .success(let data):
                let weather = Weather(temperature: data.temperature, wind: "\(data.wind) \(data.windDirection)", liveImageURL: data.liveImage.large)
                completion(weather)
            case .failure(let error):
                assertionFailure("Unable to retrieve data: \(error)")
            }
        }
    }
}
