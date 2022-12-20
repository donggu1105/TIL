//
//  ViewController.swift
//  TableView
//
//  Created by web_dev on 2022/12/19.
//

import UIKit

class ViewController: UIViewController  {


    var movieDataManager = DataManager()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.rowHeight = 120
        tableView.delegate = self
        title = "영화목록"
        movieDataManager.makeMovieData()
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        
        movieDataManager.updateMovieData()
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.mainImageView.image = movieDataManager.moviesArray[indexPath.row].movieImage
        cell.movieNameLabel.text = movieDataManager.moviesArray[indexPath.row].movieName
        cell.descriptionLabel.text = movieDataManager.moviesArray[indexPath.row].movieDescription
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return movieDataManager.moviesArray.count
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        print(indexPath.row)
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            let indexPath = sender as! IndexPath
            detailVC.movieData = self.movieDataManager.getMovieData()[indexPath.row]
        }
    }
}

