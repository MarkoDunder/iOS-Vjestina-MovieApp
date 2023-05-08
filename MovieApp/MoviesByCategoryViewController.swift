//
//  MoviesByCategoryViewController.swift
//  MovieApp
//
//  Created by endava-bootcamp on 12.04.2023..
//

import Foundation
import UIKit
import PureLayout
import MovieAppData

class MoviesByCategoryViewController: UIViewController{
        var tableView: UITableView!
        let movies = MovieUseCase().allMovies
        
        override func viewDidLoad() {
            super.viewDidLoad()
            buildViews()
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            tableView.frame = view.bounds
        }
        
        private func buildViews() {
            createViews()
            styleViews()
        }
        
        private func createViews() {
            tableView = UITableView()
            view.addSubview(tableView)

        }
        
        private func styleViews() {
            tableView.register(MovieCategoryCollection.self, forCellReuseIdentifier: MovieCategoryCollection.identifier)
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            
        }
    }

extension MoviesByCategoryViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCategoryCollection.identifier ,for:
                                                        indexPath) as? MovieCategoryCollection else {
            fatalError("Table view cannot dequeue a customcell")
        }
        
        if(indexPath.row == 0){
            let movieCollection = MovieUseCase().popularMovies
            let name = "What's popular"
            cell.setCategory(movies: movieCollection, name: name)
        }else if(indexPath.row == 1){
            let movieCollection = MovieUseCase().freeToWatchMovies
            let name = "Free to watch"
            cell.setCategory(movies: movieCollection, name: name)
        }else{
            let movieCollection = MovieUseCase().trendingMovies
            let name = "Trending"
            cell.setCategory(movies: movieCollection, name: name)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        
        return headerView
    }
    
}

