//
//  RMEpisode.swift
//  RickAndMortey
//
//  Created by Anonymous User on 13/03/23.
//

import Foundation


struct RMEpisode : Codable {
    
    let info : RMInfo
    let results : RMResults
}

struct RMInfo : Codable {
    let count : Int
    let pages : Int
    let next : String
    let prev : Double
}

struct RMResults : Codable {
    let id : Int
    let name : String
    let air_date : String
    let episode : String
    let characters : [String]
    let url : String
    let created : String
}
