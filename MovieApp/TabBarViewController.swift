//
//  TabViewController.swift
//  MovieApp
//
//  Created by endava-bootcamp on 08.05.2023..
//

import Foundation
import UIKit
import PureLayout
import MovieAppData

class TabBarViewController:UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moviesByCategoryController = MoviesByCategoryViewController()
        let favoritesController = FavoritesViewController()
        
        
        self.setViewControllers([createTabBarView(tabBarTitle: "Home", tabBarImage: UIImage(systemName: "house")!, viewController: moviesByCategoryController), createTabBarView(tabBarTitle: "Favorites", tabBarImage: UIImage(systemName: "star")!, viewController: favoritesController)], animated: false)
        
    }
    
    private func createTabBarView(tabBarTitle: String, tabBarImage: UIImage, viewController: UIViewController)-> UIViewController{
        let navigationController = UINavigationController(rootViewController: viewController)
        
        navigationController.navigationBar.tintColor = .systemBlue
        navigationController.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Go back", style: .plain, target: nil, action: nil)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController.tabBarItem = UITabBarItem(title: tabBarTitle, image: tabBarImage, selectedImage: tabBarImage)
        
        return navigationController
    }

}
