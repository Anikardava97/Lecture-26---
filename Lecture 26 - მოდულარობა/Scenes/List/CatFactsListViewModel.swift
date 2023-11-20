//
//  CatFactsListViewModel.swift
//  Lecture 26 - მოდულარობა
//
//  Created by Ani's Mac on 19.11.23.
//

import Foundation
import NetworkLayer

protocol CatFactsListViewModelDelegate: AnyObject {
    func factsFetched(_ facts: [CatFacts])
    func showError(_ error: Error)
}

final class CatFactsListViewModel {
    
    let networkManager = NetworkManager()
    
    weak var delegate: CatFactsListViewModelDelegate?
    
    func viewDidLoad() {
        fetchFacts()
    }
    
    private func fetchFacts() {
        networkManager.fetch(from: "https://catfact.ninja/facts") { [weak self] (result: Result<CatFactsResponse, NetworkError>) in
            switch result {
            case .success(let fetchedFactsResponse):
                self?.delegate?.factsFetched(fetchedFactsResponse.data)
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
}



