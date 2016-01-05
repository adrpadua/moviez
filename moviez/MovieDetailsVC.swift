//
//  MovieDetailsVC.swift
//  moviez
//
//  Created by Adrian Padua on 1/4/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class MovieDetailsVC: UIViewController {
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var linkLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var plotLbl: UILabel!
    
    var m_title = ""
    var m_link = ""
    var m_desc = ""
    var m_plot = ""
    var m_imagePath = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HOWDY HO!!!")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        titleLbl.text = m_title
        linkLbl.text = m_link
        descLbl.text = m_desc
        plotLbl.text = m_plot
        movieImg.image = DataService.instance.imageForPath(m_imagePath)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
