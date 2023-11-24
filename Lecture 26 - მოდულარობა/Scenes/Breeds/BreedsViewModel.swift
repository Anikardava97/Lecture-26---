//
//  BreedsViewModel.swift
//  Lecture 26 - მოდულარობა
//
//  Created by Ani's Mac on 20.11.23.
//

import Foundation
import NetworkLayer

protocol BreedsViewModelDelegate: AnyObject {
    func breedsFetched(_ breeds: [CatBreeds])
    func showError(_ error: Error)
}

final class BreedsViewModel {
    
    let networkManager = NetworkManager()
    
    weak var delegate: BreedsViewModelDelegate?
    
    func viewDidLoad() {
        fetchFacts()
    }
    
    private func fetchFacts() {
        networkManager.fetch(from: catBreedURL) { [weak self] (result: Result<CatBreedResponse, NetworkError>) in
            switch result {
            case .success(let fetchedBreedsResponse):
                self?.delegate?.breedsFetched(fetchedBreedsResponse.data)
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
}



