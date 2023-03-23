//
//  RMCharcterController.swift
//  RickAndMortey
//
//  Created by Anonymous User on 13/03/23.
//

import UIKit

class RMCharcterController: UIViewController {

    
    let charcterListView = CharcterListView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    
    private func setUpView(){
        charcterListView.delegate = self
        self.title = "Charcters"
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(charcterListView)
        NSLayoutConstraint.activate(
        [
            charcterListView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            charcterListView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            charcterListView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            charcterListView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)

        ]
        )
    }

}

extension RMCharcterController:CharcterListViewProtocol {
    func rmCharcterListView(_ charcterListView: CharcterListView, didSelectCharcter charcter: RMCharcter) {
        let viewModel = RMCharcterDetailViewViewModel(charcter: charcter)
        let detailVc = RMCharcterDetailViewController(viewModel: viewModel)
        detailVc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVc, animated: true)
        
    }
    
    
}
