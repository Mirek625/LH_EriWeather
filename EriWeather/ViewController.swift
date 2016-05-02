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
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBAction func setCityTapped(sender: UIButton) {
        openCityAlert()
    }
    
    func setWeather(weather:Weather) {
        self.tempLabel.text = "\(weather.temp)"
        self.descLabel.text = weather.desc
        self.cityLabel.text = weather.cityName
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
                                    self.cityLabel.text = textField?.text!
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

