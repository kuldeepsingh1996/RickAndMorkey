//
//  RMGetAllCharcterResponse.swift
//  RickAndMortey
//
//  Created by Anonymous User on 21/03/23.
//

import Foundation

struct RMGetAllCharcterResponse : Codable {
    
    struct Info : Codable {
        let count  : Int
        let pages : Int
        let next : String?
        let prev : String?
    }
    
    let info : Info
    let results : [RMCharcter]
    
    
}





