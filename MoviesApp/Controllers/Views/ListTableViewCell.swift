//
//  ListCell.swift
//  MoviesApp
//
//  Created by Igor Belobrov on 06.02.2021.
//

import Foundation
import UIKit

class ListTableViewCell: UITableViewCell {

    private var label: UILabel?
    
    func customTitle(value: Movie) {
        label = UILabel(frame: CGRect(x: 40, y: 0, width: 350, height: 50))
        label?.textAlignment = .left
        label?.text = value.original_title
        self.addSubview(label ?? UILabel())
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        label?.text = ""
    }
}

