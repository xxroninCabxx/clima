//
//  WeatherData.swift
//  Clima
//
//  Created by Cory Billeaud on 11/28/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
    let cloud: Cloud
    let coord: Coord
    let sys: Sys
    let time: Int
}

struct Main: Decodable {
    let temp: Double
    let humidity: Int
    let temp_min: Double
    let temp_max: Double
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int
}

struct Cloud: Decodable {
    let all: Int
}

struct Weather: Decodable {
    let description: String
    let id: Int
}

struct Coord: Decodable {
    let lon: Double
    let lat: Double
}

struct Sys: Decodable {
    let sunrise: Int
    let sunset: Int
}

