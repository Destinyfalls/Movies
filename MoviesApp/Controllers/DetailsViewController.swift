//
//  DetailsViewController.swift
//  MoviesApp
//
//  Created by Igor Belobrov on 08.02.2021.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieOverview: UILabel!

    var movie: Movie?
    private var url: String = "https://image.tmdb.org/t/p/original"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        guard let movie = movie else { return }
        movieImage.sd_setImage(with: URL(string: url + movie.poster_path))
        movieDate.text = "Release date: \(movie.release_date)"
        movieOverview.text = movie.overview
    }
}

