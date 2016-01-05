//
//  AddMovieVC.swift
//  moviez
//
//  Created by Adrian Padua on 1/4/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var linkField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var plotField: UITextField!
    @IBOutlet weak var movieImg: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieImg.layer.cornerRadius = 4.0
        movieImg.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    @IBAction func backPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPicBtnPressed(sender: AnyObject) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func addMoviePressed(sender: AnyObject) {
        
        if let title = titleField.text, let link = linkField.text, let desc = descField.text, let plot = plotField.text, let img = movieImg.image {
            
            let imgPath = DataService.instance.saveImageAndCreatePath(img)
            
            let movie = Movie(imagePath: imgPath, title: title, desc: desc, link: link, plot: plot)
            DataService.instance.addMovie(movie)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
    }
}
