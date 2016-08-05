//
//  Image.swift
//  FinalAssessment
//
//  Created by 蔡舜珵 on 2016/8/5.
//  Copyright © 2016年 蔡舜珵. All rights reserved.
//

import UIKit
//http://swiftcafe.io/2015/11/13/cafe-time-nscoding/
class Image: NSObject, NSCoding {
    var image: UIImage?
    var imageDescription: String?
    func encodeWithCoder(aCoder: NSCoder) {
        if let imageDescription = self.imageDescription {
            
            aCoder.encodeObject(imageDescription, forKey: "imageDescription")
            
        }
        
        if let image = self.image {
            
            if let imageData = UIImagePNGRepresentation(image) {
                
                aCoder.encodeObject(imageData, forKey: "image")
                
            }
            
        }

    }
    
    override init() {
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.imageDescription = aDecoder.decodeObjectForKey("imageDescription") as? String
        if let imageData = aDecoder.decodeObjectForKey("image") as? NSData {
            
            image = UIImage(data: imageData)
            
        }

        
        
    }
}