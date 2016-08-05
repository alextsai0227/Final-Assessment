//
//  ImageDetailViewController.swift
//  FinalAssessment
//
//  Created by 蔡舜珵 on 2016/8/4.
//  Copyright © 2016年 蔡舜珵. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    let userDefault = NSUserDefaults.standardUserDefaults()
    var imageTaken = Image()
    var imageArray = [Image]()
    var myimage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .Camera
        imagePicker.delegate = self
        self.presentViewController(imagePicker, animated: true, completion: nil)
        self.descriptionTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func imagePickerController(picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info["UIImagePickerControllerOriginalImage"] as? UIImage
        self.photoImageView.image = image
        imageTaken.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        imageTaken.imageDescription = self.descriptionTextField.text!
        ImageList.shareInstance.allImages.append(imageTaken)
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            let data = NSKeyedArchiver.archivedDataWithRootObject(ImageList.shareInstance.allImages)
            self.userDefault.setObject(data, forKey: "ImageList")
            self.userDefault.synchronize()
        })
        textField.resignFirstResponder()
        return true
    }

}
