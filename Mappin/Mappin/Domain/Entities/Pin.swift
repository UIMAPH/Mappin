//
//  Pin.swift
//  Mappin
//
//  Created by changgyo seo on 2023/05/03.
//

import Foundation
import CoreLocation

struct Pin: Equatable, Identifiable {
    
    static let empty = Pin(id: 0, count: 0, music: Music(id: "", title: "", artist: "", artwork: nil, appleMusicUrl: nil), weather: Weather(temperature: 0, symbolName: ""), createdAt: Date(), location: Location(latitude: 0, longitude: 0, locality: "", subLocality: ""))
    
    
    var id: Int
    let count: Int
    let music: Music // Song?
    let weather: Weather // Weather?
    let createdAt: Date
    var location: Location
}

