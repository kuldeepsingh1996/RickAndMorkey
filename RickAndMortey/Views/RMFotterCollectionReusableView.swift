//
//  RMFotterCollectionReusableView.swift
//  RickAndMortey
//
//  Created by Anonymous User on 23/03/23.
//

import UIKit

class RMFotterCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "RMFotterCollectionReusableView"
    
    private let spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(spinner)
        addConstraints()
    }
    
    required init(coder:NSCoder) {
        fatalError("Unsuppored")
    }
    
    private func addConstraints(){
        
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            ])
    }
    
    public func startAnimating(){
        spinner.startAnimating()
        
    }
}
