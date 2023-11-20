//
//  breedsViewController.swift
//  Lecture 26 - მოდულარობა
//
//  Created by Ani's Mac on 20.11.23.
//

import UIKit

final class BreedsViewController: UIViewController {
    
    // MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var breeds = [CatBreeds]()
    
    private let viewModel = BreedsViewModel()
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.viewDidLoad()
    }
    
    // MARK: - Private Methods
    private func setup() {
        setUpBackground()
        setupSubviews()
        setupConstraints()
        setupTableView()
        setupViewModelDelegate()
    }
    
    private func setUpBackground() {
        view.backgroundColor = .white
        tableView.backgroundColor = .white
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(BreedsTableViewCell.self, forCellReuseIdentifier: "catBreedsCell")
    }
    
    private func setupViewModelDelegate() {
        viewModel.delegate = self
    }
}

// MARK: - TableView DataSource
extension BreedsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        breeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "catBreedsCell", for: indexPath) as? BreedsTableViewCell else {
            fatalError("Could not dequeue cell with identifier: catBreedsCell")
        }
        cell.configure(with: breeds[indexPath.row] )
        return cell
    }
}

// MARK: - CatFactsListViewModelDelegate
extension BreedsViewController: BreedsViewModelDelegate {
    func breedsFetched(_ breeds: [CatBreeds]) {
        self.breeds = breeds
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError(_ error: Error) {
        print("error")
    }
    
    
}


