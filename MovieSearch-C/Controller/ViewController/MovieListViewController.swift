//
//  MovieListViewController.swift
//  MovieSearch-C
//
//  Created by Dominic Lanzillotta on 2/15/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var movies: NSMutableArray  = []{
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
}

//MARK: -Extension: TableView
extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell
        
        cell?.movie = movies[indexPath.row] as? DLMovie
        
        return cell ?? UITableViewCell()
    }
}

//MARK: -Extension: SearchBar
extension MovieListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        DLMovieController.fetchMovies(forSearchTerm: searchBar.text ?? "") { (movieArray) in
            self.movies = movieArray
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}
