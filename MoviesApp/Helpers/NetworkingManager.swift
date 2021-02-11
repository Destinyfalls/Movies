//
//  NetworkingManager.swift
//  MoviesApp
//
//  Created by Igor Belobrov on 06.02.2021.
//

import Foundation

private enum Defaults {
    static let moviesUrl = "https://api.themoviedb.org/3/movie/popular?api_key=c80eb8e333b7028df982c0ff9b65484a"
}

class NetworkingManager {
    class func getMovies(completion: (([Movie]) -> Void)?) {
        guard let url = URL(string: Defaults.moviesUrl) else
        { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else
            { return }
            
            do {
                let movieDict = try JSONDecoder().decode(MovieDict.self, from: data)
                completion?(movieDict.results)
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            
        }.resume()
    }
}
