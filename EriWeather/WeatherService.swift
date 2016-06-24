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
        let cityEscaped = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        let path = "http://api.openweathermap.org/data/2.5/weather?q=" + cityEscaped! + "&APPID=25f174748850f07a03105e8c560226f8"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, err: NSError?) in
            let json = JSON(data: data!)
            let temp = json["main"]["temp"].double
            let desc = json["weather"][0]["description"].string
            let icon = json["weather"][0]["icon"].string
            let name = json["name"].string
            let tempMin = json["main"]["temp_min"].double
            let tempMax = json["main"]["temp_max"].double
            let clouds = json["clouds"]["all"].double
            
            let weather = Weather(cityName: name!,
                                  temp: temp!,
                                  desc: desc!,
                                  icon: icon!,
                                  tempMin: tempMin!,
                                  tempMax: tempMax!,
                                  clouds: clouds!)
            
            if self.delegate != nil {
                dispatch_async(dispatch_get_main_queue(), { 
                    self.delegate?.setWeather(weather)
                })
            }
        }
        task.resume()
    }
}
