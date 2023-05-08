//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by endava-bootcamp on 01.04.2023..
//

import Foundation
import UIKit
import MovieAppData
import PureLayout


class MovieDetailsViewController: UIViewController {
    
    var posterImage:UIImage!
    let movieTitle = UILabel()
    var score = UILabel()
    let releaseDate = UILabel()
    let genre = UILabel()
    let duration = UILabel()
    let favoritesButton = UIButton()
    let overview = UILabel()
    let summary = UILabel()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        let data = MovieUseCase().getDetails(id: 111161)
//        print(data)

        let posterImage = UIImage(named: "IronMan1.jpg")
        let posterImageView = UIImageView(image: posterImage)
        movieTitle.text = MovieUseCase().getDetails(id: 111161)?.name
        movieTitle.textColor = .white
        movieTitle.font = UIFont(name: "ProximaNova-Bold", size: 14)
        if let scoreDouble = MovieUseCase().getDetails(id: 111161)?.rating {
            score.text = String(scoreDouble)
        } else {
            print("error")
        }
        score.textColor = .white
        releaseDate.text = MovieUseCase().getDetails(id: 111161)?.releaseDate
        releaseDate.textColor = .white
        if let movieCategories = MovieUseCase().getDetails(id: 111161)?.categories{
            let categoriesString = movieCategories.map({ String(describing: $0) }).joined(separator: ", ")
            genre.text = String(categoriesString)
        }
        else {
            print("err")
        }
        genre.textColor = .white
        if let movieDuration = MovieUseCase().getDetails(id: 111161)?.duration {
            duration.text = String(movieDuration)
        } else {
            print("error")
        }
        duration.textColor = .white
        
        favoritesButton.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.46, alpha: 1 )
        favoritesButton.frame.size = CGSize(width: 32, height: 32)
        favoritesButton.setImage(UIImage(named: "Vector.png"), for: .normal)
        favoritesButton.layer.cornerRadius = favoritesButton.bounds.size.height/2
        favoritesButton.autoSetDimensions(to: favoritesButton.frame.size)
        favoritesButton.clipsToBounds = true
        overview.text = "Overview"
        overview.textColor = .black
        overview.font = UIFont(name: "ProximaNova-Bold", size: 18)
        summary.text = MovieUseCase().getDetails(id: 111161)?.summary
        summary.textColor = .black
        summary.font = UIFont(name: "ProximaNova-Bold", size: 14)
        summary.numberOfLines = 0
        
        stackView.axis = .vertical //horizontal
        stackView.spacing = 20
        stackView.alignment = .top
        
        view.addSubview(posterImageView)
        view.addSubview(movieTitle)
        posterImageView.addSubview(score)
        posterImageView.addSubview(releaseDate)
        posterImageView.addSubview(genre)
        posterImageView.addSubview(duration)
        posterImageView.addSubview(favoritesButton)
        view.addSubview(overview)
        view.addSubview(summary)
        view.addSubview(stackView)
        let cast = MovieUseCase().getDetails(id: 111161)?.crewMembers ??  []
        let chunkedCast = cast.chunked(into: 3)
        
        for chunk in chunkedCast{
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 10
            
            for member in chunk{
                let name = UILabel()
                name.text = member.name
                let role = UILabel()
                role.text = member.role
                
                let columnStackView = UIStackView(arrangedSubviews: [name, role])
                columnStackView.axis = .vertical
                columnStackView.spacing = 4
                rowStackView.addArrangedSubview(columnStackView)
            }
            
            stackView.addArrangedSubview(rowStackView)
        }
        
        posterImageView.autoAlignAxis(toSuperviewAxis: .vertical)
        posterImageView.autoPinEdge(toSuperviewSafeArea: .top)
        posterImageView.autoMatch(.width, to: .width, of: view)
        posterImageView.autoMatch(.height, to: .height, of: view, withMultiplier: 0.5)
        movieTitle.autoAlignAxis(.horizontal, toSameAxisOf: posterImageView)
        movieTitle.autoPinEdge(.left, to: .left, of: posterImageView, withOffset: 10)
        score.autoPinEdge(toSuperviewSafeArea: .left, withInset: 20)
        score.autoPinEdge(.bottom, to: .top, of: movieTitle, withOffset: -20)
        releaseDate.autoPinEdge(toSuperviewSafeArea: .left, withInset: 20)
        releaseDate.autoPinEdge(.top, to: .bottom, of: movieTitle, withOffset: 20)
        genre.autoPinEdge(toSuperviewSafeArea: .left, withInset: 20)
        genre.autoPinEdge(.top, to: .bottom, of: releaseDate, withOffset: 20)
        duration.autoPinEdge(.leading, to: .trailing, of: genre, withOffset: 20)
        duration.autoAlignAxis(.horizontal, toSameAxisOf: genre)
        favoritesButton.autoPinEdge(.top, to: .bottom, of: genre, withOffset: 20)
        favoritesButton.autoAlignAxis(.vertical, toSameAxisOf: genre)
        overview.autoPinEdge(toSuperviewSafeArea: .left, withInset: 20)
        overview.autoPinEdge(.top, to: .bottom, of: posterImageView, withOffset: 20)
        summary.autoPinEdge(.top, to: .bottom, of: overview, withOffset: 20)
        summary.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 16)
        summary.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 16)
        stackView.autoPinEdge(.top, to: .bottom, of: summary, withOffset: 20)
        stackView.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        stackView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
        
    }
    
    
}
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
