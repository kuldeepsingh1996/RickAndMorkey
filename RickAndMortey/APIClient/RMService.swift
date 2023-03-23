//
//  RMService.swift
//  RickAndMortey
//
//  Created by Anonymous User on 14/03/23.
//

import Foundation

final class RMService {
    
    static let shared = RMService()
    
    private init() {
        
    }
    
    enum RMServiceError : Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    public func execute<T:Codable>(_ request:RMRequest,expecting type : T.Type,completion:@escaping(Result<T,Error>) -> Void) {
        
        guard let urlRequest = self.request(rmRequest: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data , error == nil else{
                completion(.failure(RMServiceError.failedToGetData))
                return
            }
            //Decode
            do {
                let json = try JSONDecoder().decode(type.self, from: data)
                completion(.success(json))
            }catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
//    MARK:Private
    
    private func request(rmRequest:RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        print("Complete url----",url)
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
    
}


