//
//  DetailViewController.swift
//  TableViewCode
//
//  Created by Allen H on 2022/01/20.
//

import UIKit

final class DetailViewController: UIViewController {

    // MVC패턴을 위한 따로만든 뷰
    private let detailView = DetailView()
    
    // 전화면에서 Movie데이터를 전달 받기 위한 변수
    var movieData: Movie?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        detailView.mainImageView.image = movieData?.movieImage
        detailView.movieNameLabel.text = movieData?.movieName
        detailView.descriptionLabel.text = movieData?.movieDescription
    }
    
}
