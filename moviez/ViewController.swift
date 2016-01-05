//
//  ViewController.swift
//  moviez
//
//  Created by Adrian Padua on 1/5/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        DataService.instance.loadMovies()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onMoviesLoaded:", name: "moviesLoaded", object: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let movie = DataService.instance.loadedMovies[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            cell.configureCell(movie)
            return cell
        } else {
            let cell = MovieCell()
            cell.configureCell(movie)
            return cell
        }
    }
    
    func onMoviesLoaded(notif: AnyObject) {
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedMovies.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("goToDetails", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToDetails" {
            if let detailsVC = segue.destinationViewController as? MovieDetailsVC {
                if let index = tableView.indexPathForSelectedRow?.row {
                    print(index)
                    let movie = DataService.instance.loadedMovies[index]
                    
                    detailsVC.m_title = movie.title
                    detailsVC.m_link = movie.link
                    detailsVC.m_desc = movie.desc
                    detailsVC.m_plot = movie.plot
                    detailsVC.m_imagePath = movie.imagePath
                    
                    print(movie.desc)
                    print(movie.plot)
                }
            }
        }
    }
}