//
//  RMCharcterCollectionViewCellViewModel.swift
//  RickAndMortey
//
//  Created by Anonymous User on 22/03/23.
//

import Foundation


class RMCharcterCollectionViewCellViewModel {
    
    public let charcterName:String
    private let charcterStatus:RMCharcterStatus
    private let charcterImageUrl:URL?
    
    
    init(charcterName:String,charcterStatus:RMCharcterStatus,charcterImageUrl:URL?) {
        self.charcterName = charcterName
        self.charcterStatus = charcterStatus
        self.charcterImageUrl = charcterImageUrl
    }
    
    
    public var charcterStausText:String {
        return "Status : \(charcterStatus.rawValue)"
    }
    
    public func fetchImage(completion:@escaping(Result<Data,Error>) -> Void) {
        guard let url = charcterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data , error == nil else{
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        dataTask.resume()
    }
}
