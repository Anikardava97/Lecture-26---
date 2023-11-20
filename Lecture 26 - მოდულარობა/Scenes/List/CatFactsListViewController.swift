//
//  CatFactsListViewController.swift
//  Lecture 26 - მოდულარობა
//
//  Created by Ani's Mac on 19.11.23.
//

import UIKit

final class CatFactsListViewController: UIViewController {
    
    // MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var facts = [CatFacts]()
    
    private let viewModel = CatFactsListViewModel()
    
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
        tableView.register(CatFactTableViewCell.self, forCellReuseIdentifier: "catFactsCell")
    }
    
    private func setupViewModelDelegate() {
        viewModel.delegate = self
    }
}

// MARK: - TableView DataSource
extension CatFactsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        facts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "catFactsCell", for: indexPath) as? CatFactTableViewCell else {
            fatalError("Could not dequeue cell with identifier: catFactsCell")
        }
        cell.configure(with: facts[indexPath.row])
        return cell
    }
}

// MARK: - CatFactsListViewModelDelegate
extension CatFactsListViewController: CatFactsListViewModelDelegate {
    func factsFetched(_ facts: [CatFacts]) {
        self.facts = facts
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError(_ error: Error) {
        print("error")
    }
    
    
}

