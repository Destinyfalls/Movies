//
//  FirstViewController.swift
//  MoviesApp
//
//  Created by Igor Belobrov on 03.02.2021.
//

import UIKit
import SnapKit

private enum Defaults {
    static let reuseIdentifier = "ListTableViewCell"
}

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var movies = [Movie]()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 50
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        NetworkingManager.getMovies(completion: { movies in
            self.movies = movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
        let longPress = UILongPressGestureRecognizer()
        self.tableView.addGestureRecognizer(longPress)
        longPress.addTarget(self, action: #selector(clickLongPress))
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: Defaults.reuseIdentifier)
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    @objc func clickLongPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if longPressGestureRecognizer.state == UIGestureRecognizer.State.began {
            let touchPoint = longPressGestureRecognizer.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                let alertController = UIAlertController(title: .none, message: "Do you want to add this movie to your favorites?", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                    let element = self.movies[indexPath.row]
                    if DefaultsManager.shared.favouriteMovies.contains(where: { $0.original_title == element.original_title }) == false {
                        DefaultsManager.shared.favouriteMovies.append(element) }
                }
                let cancelAction = UIAlertAction(title: "No", style: UIAlertAction.Style.destructive) {
                    UIAlertAction in
                    return
                }
                alertController.addAction(cancelAction)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Defaults.reuseIdentifier, for: indexPath) as! ListTableViewCell
        let title = movies[indexPath.row]
        cell.customTitle(value: title)
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        newViewController.movie = movies[indexPath.row]
        self.present(newViewController, animated: true, completion: nil)
    }
}
