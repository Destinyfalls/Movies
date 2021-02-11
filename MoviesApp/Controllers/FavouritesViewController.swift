//
//  SecondViewController.swift
//  MoviesApp
//
//  Created by Igor Belobrov on 03.02.2021.
//

import UIKit

private enum Defaults {
    static let reuseIdentifier = "FavouritesTableViewCell"
}

class FavouritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 50
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Defaults.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: Defaults.reuseIdentifier)
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DefaultsManager.shared.favouriteMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Defaults.reuseIdentifier, for: indexPath) as! FavouritesTableViewCell
        let title = DefaultsManager.shared.favouriteMovies[indexPath.row].original_title
        cell.configureCell(value: title)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "FavouritesOverviewViewController") as! FavouritesOverviewViewController
        newViewController.movie = DefaultsManager.shared.favouriteMovies[indexPath.row]
        self.present(newViewController, animated: true, completion: nil)
        
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            DefaultsManager.shared.favouriteMovies.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
}
