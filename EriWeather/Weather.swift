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
    
    init(cityName: String, temp: Double, desc: String) {
        self.cityName = cityName
        self.temp = temp
        self.desc = desc
    }
}