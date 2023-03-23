//
//  Extensions.swift
//  RickAndMortey
//
//  Created by Anonymous User on 21/03/23.
//

import UIKit


extension UIView {
    
    func addSubviews(_ uiView:UIView...) {
        uiView.forEach({
            addSubview($0)
        })
    }
}
