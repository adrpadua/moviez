//
//  MovieCell.swift
//  moviez
//
//  Created by Adrian Padua on 1/4/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var linkLbl: UILabel!
    @IBOutlet weak var cellImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImg.layer.cornerRadius = 5.0
        cellImg.layer.shadowColor = UIColor.blackColor().CGColor
        cellImg.layer.shadowOffset = CGSizeMake(0, 1)
        cellImg.layer.shadowRadius = 1.0
        cellImg.clipsToBounds = true

    }

    func configureCell(movie: Movie) {
        titleLbl.text = movie.title
        descLbl.text = movie.desc
        linkLbl.text = movie.link
        cellImg.image = DataService.instance.imageForPath(movie.imagePath)
    }

}
