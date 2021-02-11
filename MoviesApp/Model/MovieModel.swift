//
//  MovieModel.swift
//  MoviesApp
//
//  Created by Igor Belobrov on 06.02.2021.
//

import Foundation

struct Movie: Codable {
    let original_title: String
    let overview: String
    let release_date: String
    let poster_path: String
    let vote_average: Double
    let vote_count: Int
}

struct MovieDict: Codable {
    var results: [Movie]
}
