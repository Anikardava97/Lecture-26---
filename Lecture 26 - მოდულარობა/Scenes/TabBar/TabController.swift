//
//  TabController.swift
//  Lecture 26 - მოდულარობა
//
//  Created by Ani's Mac on 20.11.23.
//

import UIKit

final class TabController: UITabBarController {
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        setupTabUI()
    }
    
    // MARK: - Setup Tab
    private func setupTabs() {
        let catFacts = createNavigation(with: "Fact", image: UIImage(systemName: "list.clipboard"), viewController: CatFactsListViewController())
        let catBreeds = createNavigation(with: "Breed", image: UIImage(systemName: "cat"), viewController: BreedsViewController())
        self.setViewControllers([catFacts, catBreeds], animated: true)
    }
    
    private func createNavigation(with title: String, image: UIImage?, viewController: UIViewController) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: viewController)
        
        navigation.tabBarItem.title = title
        navigation.tabBarItem.image = image
        navigation.viewControllers.first?.navigationItem.title = "Facts about C🤍A🤍T🤍S 🐈‍⬛🐈"
        return navigation
    }
    
    // MARK: - Setup Tab UI
    private func setupTabUI() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .lightGray
    }
}

