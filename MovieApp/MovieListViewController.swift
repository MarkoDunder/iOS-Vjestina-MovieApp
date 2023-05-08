//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by endava-bootcamp on 07.04.2023..
//

import Foundation
import UIKit
import PureLayout
import MovieAppData
class MovieListViewController: UIViewController {
    
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
        defineLayoutForViews()
    }
    
    private func createViews() {
        tableView = UITableView()
        view.addSubview(tableView)
    }
    
    private func styleViews() {
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self

    }
    private func defineLayoutForViews() {
        tableView.autoPinEdge(toSuperviewEdge: .bottom)
        tableView.autoPinEdge(toSuperviewEdge: .top)
        tableView.autoPinEdge(toSuperviewEdge: .leading)
        tableView.autoPinEdge(toSuperviewEdge: .trailing)
    }

}

extension MovieListViewController:UITableViewDataSource,UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return movies.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier ,for:
                indexPath) as? MovieTableViewCell else {
                fatalError("Table view cannot dequeue a customcell")
            }

            let movie = movies[indexPath.row]
            cell.set(movie: movie)
            cell.selectionStyle = .none
            
            return cell
        }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
    }


