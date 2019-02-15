//
//  MoviewTableViewCell.swift
//  MovieSearch-C
//
//  Created by Dominic Lanzillotta on 2/15/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    //MARK: - Properties
    var movie: DLMovie? {
        didSet {
            updateView()
        }
    }
    
    //MARK: - Private Functions
    func updateView(){
        titleLabel.text = movie?.title
        ratingLabel.text = String(format: "%.2f", movie?.rating ?? 0.0)
        summaryLabel.text = movie?.overview
        movieImageView.image = nil
    }
}
