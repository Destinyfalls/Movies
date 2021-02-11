//
//  FavouritesOverviewViewController.swift
//  MoviesApp
//
//  Created by Igor Belobrov on 10.02.2021.
//

import UIKit
import SDWebImage

class FavouritesOverviewViewController: UIViewController {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieVoteAverage: UILabel!
    @IBOutlet weak var movieVoteCount: UILabel!
    
    var movie: Movie?
    private var url: String = "https://image.tmdb.org/t/p/original"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        guard let movie = movie else { return }
        movieImage.sd_setImage(with: URL(string: url + movie.poster_path))
        movieTitle.text = movie.original_title
        movieVoteAverage.text = "Average: \(String(movie.vote_average))"
        movieVoteCount.text = "Voted: \(String(movie.vote_count))"
    }
}
