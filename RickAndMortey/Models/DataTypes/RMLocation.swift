//
//  RMLocation.swift
//  RickAndMortey
//
//  Created by Anonymous User on 13/03/23.
//

import Foundation


struct RLocation : Codable {
    let info : RLInfo
    let results : RLResults
}

struct RLInfo  : Codable{
    let count : Int
    let pages : Int
    let next : String
    let prev : Double
}

struct RLResults : Codable {
    let id : Int
    let name : String
    let type : String
    let dimension : String
    let residents : [String]
    let url : String
    let created : String
}


