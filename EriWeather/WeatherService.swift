//
//  WeatherService.swift
//  EriWeather
//
//  Created by Luca Hagel on 5/2/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import Foundation

protocol WeatherServiceDelegate {
    func setWeather(weather: Weather)
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    func getWeather(city: String) {
        //request weather data
        let weather = Weather(cityName: city, temp: 237.12, desc: "A nice day")
        //return weather data
        if delegate != nil {
            delegate?.setWeather(weather)
        }
    }
}
