//
//  Weather.swift
//  EriWeather
//
//  Created by Luca Hagel on 5/2/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import Foundation

struct Weather {
    let cityName: String
    let temp: Double
    let desc: String
    let icon: String
    let tempMin: Double
    let tempMax: Double
    let clouds: Double
    
    init(cityName: String,
         temp: Double,
         desc: String,
         icon: String,
         tempMin: Double,
         tempMax: Double,
         clouds: Double) {
        self.cityName = cityName
        self.temp = temp
        self.desc = desc
        self.icon = "http://openweathermap.org/img/w/\(icon).png"
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.clouds = clouds
    }
}