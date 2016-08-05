//
//  ImageTableViewController.swift
//  FinalAssessment
//
//  Created by 蔡舜珵 on 2016/8/4.
//  Copyright © 2016年 蔡舜珵. All rights reserved.
//

import UIKit

class ImageTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var imageTableView: UITableView!
    var imageList = [Image]()
    var tryimageList = [Image]()
    var selectedImage = Image()
    let userDefault = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageTableView.dataSource = self
        self.imageTableView.delegate = self
        self.imageTableView.registerNib(UINib(nibName: "ImageTableViewCell",bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
    }
    override func viewWillAppear(animated: Bool) {
        if let imageData = userDefault.objectForKey("ImageList") as? NSData {
            if let image = NSKeyedUnarchiver.unarchiveObjectWithData(imageData) as? [Image] {
                imageList = image
                ImageList.shareInstance.allImages = image
            }
        }
//        imageList = ImageList.shareInstance.allImages
        self.imageTableView.reloadData()
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imageList.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.imageTableView.dequeueReusableCellWithIdentifier("ImageTableViewCell") as! ImageTableViewCell
        
        cell.tableImageView.image = imageList[indexPath.row].image
        cell.imageLabel.text = imageList[indexPath.row].imageDescription
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedImage = self.imageList[indexPath.row]
        performSegueWithIdentifier("showImageScrollVC", sender: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showImageScrollVC" {
            let vc = segue.destinationViewController as! ImageViewController
            vc.myimage = selectedImage
        }
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            ImageList.shareInstance.allImages.removeAtIndex(indexPath.row)
            let data = NSKeyedArchiver.archivedDataWithRootObject(ImageList.shareInstance.allImages)
            userDefault.setObject(data, forKey: "ImageList")
            userDefault.synchronize()
            imageList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
}
