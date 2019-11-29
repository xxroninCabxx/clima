//
//  WeatherModel.swift
//  Clima
//
//  Created by Cory Billeaud on 11/28/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    let maxTemp: Double
    let minTemp: Double
    let windSpeed: Double
    let windDeg: Int
    let clouds: Int
    let sunrise: Int
    let sunset: Int
    let humidty: Int
    let long: Double
    let lat: Double
    let time: Int
    
    func getConditionalName(weatherId: Int) -> String {
        switch weatherId {
        case 200...232:
            return "cloud.bolt"
        case 300...331:
            return "cloud.dizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 700...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
