//
//  CollectionViewController.swift
//  FinalAssessment
//
//  Created by 蔡舜珵 on 2016/8/4.
//  Copyright © 2016年 蔡舜珵. All rights reserved.
//

import UIKit
import MessageUI
class CollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var mutiCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mutiCollectionView.dataSource = self
        self.mutiCollectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        

            let spacingWidth = Float(10)
            let width = (Float(UIScreen.mainScreen().bounds.width) - spacingWidth * Float(2 + 1)) / 2
            self.flowLayout.itemSize = CGSize(width: CGFloat(width), height: CGFloat(width))
            return self.flowLayout.itemSize

        
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("mutiCollectionView", forIndexPath: indexPath) as! MutiCollectionViewCell
        if indexPath.row == 0{
            cell.mutiButton.setTitle("顯示一個AlertView", forState: .Normal)
        }else if indexPath.row == 1{
            cell.mutiButton.setTitle("顯示一個ActionView", forState: .Normal)
        }else if indexPath.row == 2{
            cell.mutiButton.setTitle("撥打117", forState: .Normal)
        }else if indexPath.row == 3{
            cell.mutiButton.setTitle("開啟APP在iOS設定", forState: .Normal)
        }else if indexPath.row == 4{
            cell.mutiButton.setTitle("打開地圖導航到AC", forState: .Normal)
        }else if indexPath.row == 5{
            cell.mutiButton.setTitle("開啟信箱“測試信件”", forState: .Normal)
        }
        
       return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        if indexPath.row == 0 {
            let alert = UIAlertController(title: "Question", message: "想戀愛嗎？", preferredStyle: .Alert)
            let noAction = UIAlertAction(title: "NO", style: .Default, handler: nil)
            let yesAction = UIAlertAction(title: "YES", style: .Default, handler: nil)
            alert.addAction(noAction)
            alert.addAction(yesAction)
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        if indexPath.row == 1 {
            let alert2 = UIAlertController(title: "Question2", message: "想跟誰戀愛", preferredStyle: .ActionSheet)
            
            let nameAction1 = UIAlertAction(title: "Angela", style: .Default, handler: nil)
            let nameAction2 = UIAlertAction(title: "Ariel", style: .Default, handler: nil)
            let nameAction3 = UIAlertAction(title: "Alice", style: .Default, handler: nil)
            alert2.addAction(nameAction1)
            alert2.addAction(nameAction2)
            alert2.addAction(nameAction3)
            self.presentViewController(alert2, animated: true, completion: nil)

        }
        if indexPath.row == 2{
            if let url = NSURL(string: "tel://117") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        if indexPath.row == 3{
            let appSetting = NSURL(string: UIApplicationOpenSettingsURLString)
            UIApplication.sharedApplication().openURL(appSetting!)
        }
        if indexPath.row == 4{
            let encodedName = "104台北市中山區南京東路二段97號".stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())
            let path = "http://maps.apple.com/?q=" + encodedName!
            if let url = NSURL(string: path) {
                UIApplication.sharedApplication().openURL(url)
            } else {
                // Could not construct url. Handle error.
            }
        }
        if indexPath.row == 5{
            if( MFMailComposeViewController.canSendMail() ) {
                
                let mailComposer = MFMailComposeViewController()
                mailComposer.mailComposeDelegate = self
                
                //Set the subject and message of the email
                mailComposer.setSubject("測試信件")
                self.presentViewController(mailComposer, animated: true, completion: nil)
            }
        }
        
        
    }
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
