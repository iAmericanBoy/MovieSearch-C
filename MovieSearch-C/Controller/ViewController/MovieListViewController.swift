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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
//MARK: -Extension: SearchBar
extension MovieListViewController: UISearchBarDelegate {
    
}
