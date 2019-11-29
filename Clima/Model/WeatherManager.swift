//
//  WeatherManager.swift
//  Clima
//
//  Created by Cory Billeaud on 11/21/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct WeatherManager {
    let WEATHER_URL = "https://api.openweathermap.org/data/2.5/weather?appid=d69ffb7363aa3aec20c923612d701a11&units=metric"
    let APP_ID = "&appid="
    let API_KEY = "d69ffb7363aa3aec20c923612d701a11"
    let URL_UNITS = "&units=imperial"
    
    // https://maps.owm.io/map/{layer}/{z}/{x}/{y}.png?appid={api_key}
    // {layer} == layer name
    // {z} == number of zoom level
    // {x} == number of x tile coordinate
    // {y} == number of y tile coordinate
    // {api_key} == Your API key

    
    let mapLayerURL = "https://tile.openweathermap.org/map/layer=clouds/20/10/10.png?appid=d69ffb7363aa3aec20c923612d701a11&q=Houston"


    
    func fetchWeather(cityName: String) {
        let currentWeatherUrlString = "\(WEATHER_URL)&q=\(cityName)"
        self.performRequest(urlString: currentWeatherUrlString)
        print(currentWeatherUrlString)
    }
    
    func performRequest(urlString: String) {
        // Create a URL
        if let url = URL(string: urlString) {
            // Create a URLSession
            let session = URLSession(configuration: .default)
            // Give session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            // Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let cityName = decodedData.name
            let temp = decodedData.main.temp
            let windSpeed = decodedData.wind.speed
            let windDeg = decodedData.wind.deg
            let sunrise = decodedData.sys.sunrise
            let sunset = decodedData.sys.sunset
            let clouds = decodedData.cloud.all
            let tempMin = decodedData.main.temp_min
            let tempMax = decodedData.main.temp_max
            let longitude = decodedData.coord.lon
            let latitude = decodedData.coord.lat
            let humidity = decodedData.main.humidity
            let currTime = decodedData.time
            
            // Create Instance of Weather Class
            let weather = WeatherModel(conditionId: id, cityName: cityName, temperature: temp, maxTemp: tempMax, minTemp: tempMin, windSpeed: windSpeed, windDeg: windDeg, clouds: clouds, sunrise: sunrise, sunset: sunset, humidty: humidity, long: longitude, lat: latitude, time: currTime)
            print(weather.getConditionalName(weatherId: id))
        } catch {
            print(error)
        }
    }
    
}
