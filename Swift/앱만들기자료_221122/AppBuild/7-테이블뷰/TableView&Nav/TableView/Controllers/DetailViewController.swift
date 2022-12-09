//
//  DetailViewController.swift
//  TableView
//
//  Created by Allen H on 2022/01/17.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movieData: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainImageView.image = movieData?.movieImage
        movieNameLabel.text = movieData?.movieName
        descriptionLabel.text = movieData?.movieDescription
    }
    


}
