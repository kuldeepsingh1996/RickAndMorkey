//
//  RMRequest.swift
//  RickAndMortey
//
//  Created by Anonymous User on 14/03/23.
//

import Foundation

final class RMRequest {
    //https://rickandmortyapi.com/api/character/2

    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
   private let endPoint : RMEndPoint
    private let pathComponent : [String]
    private let queryParameter : [URLQueryItem]
    
    private var urlString : String {
        var string = Constants.baseUrl
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponent.isEmpty {
            pathComponent.forEach({
                string += "\($0)"
            })
        }
        
        if !queryParameter.isEmpty {
            string +=  "?"
            let argumentString = queryParameter.compactMap({
                guard let value = $0.value else {
                    return nil
                }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        return string
    }
    
    public let httpMethod = "GET"
    
    public var url : URL? {
        return URL(string: urlString)
    }
    
   public init(endPoint: RMEndPoint, pathComponent: [String] = [], queryParameter: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponent = pathComponent
        self.queryParameter = queryParameter
    }
}


extension RMRequest {
    
    static let getListCharcterRequest = RMRequest(endPoint: .character)
    
}


