//
//  RMCharcters.swift
//  RickAndMortey
//
//  Created by Anonymous User on 13/03/23.
//

import Foundation


struct RMCharcter : Codable {
    let  id : Int
    let  name : String
    let  status : RMCharcterStatus
    let  species : String
    let  type : String
    let  gender : RMCharcterGender
    let  origin : RMOrigin
    let  location : RCLocation
    let  image : String
    let  episode : [String]
    let  url : String
    let  created : String
}

enum RMCharcterStatus : String,Codable {
    
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var text : String {
        switch self {
            
        case .alive,.dead:
            return rawValue
        
        case .unknown:
            return "Unknown"
        }
    }
    
}

struct RMOrigin : Codable {
    let name : String
    let url: String
}

struct RCLocation : Codable {
    let name : String
    let url : String
}

enum RMCharcterGender:String,Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
}
