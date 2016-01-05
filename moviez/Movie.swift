//
//  Movie.swift
//  moviez
//
//  Created by Adrian Padua on 1/3/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation

class Movie: NSObject, NSCoding {
    
    private var _imagePath: String!
    private var _title: String!
    private var _desc: String!
    private var _link: String!
    private var _plot: String!
    
    var imagePath: String {
        return _imagePath
    }
    
    var title: String {
        return _title
    }
    
    var desc: String {
        return _desc
    }
    
    var link: String {
        return _link
    }
    
    var plot: String {
        return _plot
    }
    
    init(imagePath: String, title: String, desc: String, link: String, plot: String) {
        self._title = title
        self._imagePath = imagePath
        self._desc = desc
        self._link = link
        self._plot = plot
    }
    
    override init() {
        
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._desc = aDecoder.decodeObjectForKey("desc") as? String
        self._link = aDecoder.decodeObjectForKey("link") as? String
        self._plot = aDecoder.decodeObjectForKey("plot") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        aCoder.encodeObject(self._title, forKey: "title")
        aCoder.encodeObject(self._desc, forKey: "desc")
        aCoder.encodeObject(self._link, forKey: "link")
        aCoder.encodeObject(self._plot, forKey: "plot")
    }
    
}