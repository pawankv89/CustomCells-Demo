//
//  MovieListViewController.swift
//  CustomCells Demo
//
//  Created by Pawan kumar on 24/04/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit


class MovieListViewController: UIViewController {
    
    fileprivate let moviesList = MovieDataSource.moviesList()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.estimatedRowHeight = 80
        tableview.rowHeight = UITableView.automaticDimension
        tableview.register(MovieCellWitOutXIB.self, forCellReuseIdentifier: MovieCellWitOutXIB.identifire)
        //tableview.register(UINib(nibName: MovieCell.identifire, bundle: nil), forCellReuseIdentifier: MovieCell.identifire)
        
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        print("Navigate ViewController:-\(String(describing: segue.identifier))")
        
    }
    
}


extension MovieListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: MovieCellWitOutXIB.identifire, for: indexPath) as! MovieCellWitOutXIB
        
        let movie = moviesList[indexPath.row]
        cell.movie = movie
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //self.performSegue(withIdentifier: "DetailsViewController", sender: nil)
    }
    
}
