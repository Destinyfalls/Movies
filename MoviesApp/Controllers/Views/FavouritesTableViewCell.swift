//
//  FavouritesTableViewCell.swift
//  MoviesApp
//
//  Created by Igor Belobrov on 09.02.2021.
//

import UIKit

class FavouritesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    
    func configureCell(value:String) {
        movieTitle.text = value
    }
}
