//
//  ImageViewController.swift
//  FinalAssessment
//
//  Created by 蔡舜珵 on 2016/8/5.
//  Copyright © 2016年 蔡舜珵. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    var myimage = Image()
    @IBOutlet weak var ImageScrollView: UIScrollView!    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var imageDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myImageView.image = myimage.image
        self.imageDescriptionLabel.text = myimage.imageDescription
        self.ImageScrollView.delegate = self
        self.ImageScrollView.contentSize = myImageView!.frame.size
        self.ImageScrollView.maximumZoomScale = 5.0
        self.ImageScrollView.minimumZoomScale = 0.1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.myImageView
    }

  

}
