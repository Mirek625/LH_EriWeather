//
//  ViewController.swift
//  EriWeather
//
//  Created by Luca Hagel on 5/2/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {
    
    let weatherService = WeatherService()

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var cloudsLabel: UILabel!
    @IBOutlet weak var cityButtonText: UIButton!
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBAction func setCityTapped(sender: UIButton) {
        openCityAlert()
    }
    
    func setWeather(weather: Weather) {
        let tempInCelsius = weather.temp - 273.15
        self.tempLabel.text = "\(tempInCelsius)°"
        self.descLabel.text = weather.desc
        self.tempMinLabel.text  = "min: \(weather.tempMin - 273.15)°"
        self.tempMaxLabel.text  = "max: \(weather.tempMax - 273.15)°"
        self.cloudsLabel.text = "Clouds: \(weather.clouds)%"
        self.cityButtonText.setTitle(weather.cityName, forState: UIControlState.Normal)
        let url = NSURL(string: weather.icon)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        weatherImage.image = UIImage(data: data!)
    }
    
    func openCityAlert() {
        let alert = UIAlertController(
            title: "City",
            message: "Enter your city:",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancel = UIAlertAction(title: "Cancel",
                                   style: UIAlertActionStyle.Cancel,
                                   handler: nil)
        
        let save = UIAlertAction(title: "Save",
                                 style: UIAlertActionStyle.Default) { (action: UIAlertAction) in
                                    let textField = alert.textFields?[0]
                                    self.weatherService.getWeather((textField?.text!)!)
        }
        
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField) in
            textField.placeholder = "City Name"
        }
        
        alert.addAction(cancel)
        alert.addAction(save)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.weatherService.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

