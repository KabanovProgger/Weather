//
//  ViewController.swift
//  Weather
//
//  Created by Owner on 7/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var getWeatherButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapWeatherButton(_ sender: Any) {
        let urlString = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m&timezone=Europe%2FBerlin&forecast_days=1"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request){data,response, error in
            if let data, let weather = try?  JSONDecoder().decode(WeatherData.self, from: data)	{
                DispatchQueue.main.async {
                    self.weatherLabel.text = "\(weather.current.temperature2M)"
                    self.weatherLabel.textAlignment = NSTextAlignment.center
                }
                
            } else {
                print ("Fail")
            }
            
        }
        task.resume()
    }
}

