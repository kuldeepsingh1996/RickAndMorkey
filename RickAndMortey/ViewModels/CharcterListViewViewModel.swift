//
//  CharcterListViewViewModel.swift
//  RickAndMortey
//
//  Created by Anonymous User on 21/03/23.
//

import UIKit

protocol CharcterListViewViewModelProtocol : AnyObject {
     func didLoadInitialCharcter()
    func didSelectCharcter(charcter:RMCharcter)
}

final class CharcterListViewViewModel : NSObject {
    
    public weak var delegate : CharcterListViewViewModelProtocol?
    private var isLoadingMoreCharcter = false
    private var charcters : [RMCharcter] = [] {
        didSet {
            for char in charcters {
                let viewModel = RMCharcterCollectionViewCellViewModel(charcterName: char.name, charcterStatus: char.status, charcterImageUrl: URL(string: char.image))
                cellViewModel.append(viewModel)
            }
        }
    }
    
    private var cellViewModel : [RMCharcterCollectionViewCellViewModel] = []
    
//    MARK:Fetch Initial Charcter
    
    func fetchCharcters() {
        RMService.shared.execute(.getListCharcterRequest, expecting: RMGetAllCharcterResponse.self) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                let info = responseModel.info
                self?.charcters = results
                self?.apiInfo = info
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharcter()
                }
            case .failure(_):
                print("Error")
            }
        }
    }
    
    public var apiInfo : RMGetAllCharcterResponse.Info? = nil
    
/// Paginate if additional charcter is needed
    public func fetchAdditionalCharcterNeeded(){
        
    }
    
    public var shouldShowLoadMoreCharcter : Bool {
        return apiInfo?.next != nil
    }
    
}

//MARK:CollectionView
extension CharcterListViewViewModel:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharcterCollectionViewCell.reuseIdentifier, for: indexPath) as? RMCharcterCollectionViewCell else {
            fatalError("Unsupported Cell")
        }
        let viewModel = cellViewModel[indexPath.row]
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width*1.5)
    }
  
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let charcter = charcters[indexPath.row]
        delegate?.didSelectCharcter(charcter: charcter)
    }
    
//    MARK:Footer
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard  kind == UICollectionView.elementKindSectionFooter  else {
            fatalError("Unsupported")
        }
        
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RMFotterCollectionReusableView.identifier, for: indexPath) as! RMFotterCollectionReusableView
        footer.startAnimating()
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard shouldShowLoadMoreCharcter else {
            return .zero
        }
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}

//MARK:ScrollView

extension CharcterListViewViewModel:UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard shouldShowLoadMoreCharcter , !isLoadingMoreCharcter else {
            return
        }
        let offset = scrollView.contentOffset.y
        let totalContentHeight = scrollView.contentSize.height
        let totalScrollViewFixedHeight = scrollView.frame.size.height
        
        if offset >= (totalContentHeight-totalScrollViewFixedHeight-120) {
            isLoadingMoreCharcter = true
            print("Should start fetch more")
        }
        
    }
}
