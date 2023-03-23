//
//  RMCharcterDetailViewViewModel.swift
//  RickAndMortey
//
//  Created by Anonymous User on 23/03/23.
//

import Foundation

final class RMCharcterDetailViewViewModel {
    
    private let charcter:RMCharcter
    
    init(charcter: RMCharcter) {
        self.charcter = charcter
    }
    
    public var titleName:String {
        return charcter.name.uppercased()
    }
    
    
}
