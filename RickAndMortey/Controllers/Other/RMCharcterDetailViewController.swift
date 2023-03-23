//
//  RMCharcterDetailViewController.swift
//  RickAndMortey
//
//  Created by Anonymous User on 23/03/23.
//

import UIKit

class RMCharcterDetailViewController: UIViewController {

    let viewModel:RMCharcterDetailViewViewModel
    init(viewModel:RMCharcterDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = viewModel.titleName
    }
    


}
