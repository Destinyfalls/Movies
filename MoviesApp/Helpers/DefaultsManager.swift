//
//  DefaultsManager.swift
//  MoviesApp
//
//  Created by Igor Belobrov on 06.02.2021.
//


import Foundation

enum UserDefaultsNames {
    static let favourites = "favourites"
}

final class DefaultsManager {

    // MARK: - Private Properties

    private let userDefaults: UserDefaults = UserDefaults.standard

    // MARK: - Public Properties

    static let shared: DefaultsManager = DefaultsManager()

    var favouriteMovies: [Movie] {
        get {
            let decoder = JSONDecoder()
            guard let objects = userDefaults.value(forKey: UserDefaultsNames.favourites) as? Data,
                  let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [Movie] else { return [] }
            return objectsDecoded
        }
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue){
                userDefaults.set(encoded, forKey: UserDefaultsNames.favourites)
            }
        }
    }
}

