//
//  CharcterListView.swift
//  RickAndMortey
//
//  Created by Anonymous User on 21/03/23.
//

import UIKit

protocol CharcterListViewProtocol : AnyObject {
    
    func rmCharcterListView(_ charcterListView:CharcterListView,didSelectCharcter charcter:RMCharcter)
}
class CharcterListView: UIView {
    
    private let viewModel = CharcterListViewViewModel()
    public weak var delegate : CharcterListViewProtocol?
    private let spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RMCharcterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharcterCollectionViewCell.reuseIdentifier)
        //For register Footter
        collectionView.register(RMFotterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: RMFotterCollectionReusableView.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.addSubviews(collectionView,spinner)
        addConstranits()
        spinner.startAnimating()
        viewModel.delegate = self
        viewModel.fetchCharcters()
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstranits() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
    }
    
    
}

extension CharcterListView : CharcterListViewViewModelProtocol {
    func didSelectCharcter(charcter: RMCharcter) {
        delegate?.rmCharcterListView(self, didSelectCharcter: charcter)
    }
    
    
    func didLoadInitialCharcter() {
        self.spinner.stopAnimating()
        self.collectionView.isHidden = false
        self.collectionView.reloadData() //Inital fetch
        UIView.animate(withDuration: 0.4) {
            self.collectionView.alpha = 1
        }
    }
    
    
}
