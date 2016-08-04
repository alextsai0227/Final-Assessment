//
//  MapViewController.swift
//  FinalAssessment
//
//  Created by 蔡舜珵 on 2016/8/4.
//  Copyright © 2016年 蔡舜珵. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class MapViewController: UIViewController, CLLocationManagerDelegate {
    let locatoinManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Ask prompting for location authorization
        self.locatoinManager.requestWhenInUseAuthorization()
        
        // Update user location
        self.locatoinManager.delegate = self
        self.locatoinManager.requestLocation()
//        self.locatoinManager.startUpdatingLocation()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.isEmpty == false {
            let userLocation = locations.first
            //             delta: the range of latitude/longitude
            let latDelta: CLLocationDegrees = 1
            let lonDelta: CLLocationDegrees = 1
            
            let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
            let location: CLLocationCoordinate2D = (userLocation?.coordinate)!
            let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
            
            self.mapView.setRegion(region, animated: true)
            self.mapView.showsUserLocation = true
            let alphaCampCoordinate = CLLocationCoordinate2DMake(25.052289, 121.5300649)
            let alphaCampMark = MKPlacemark(coordinate: alphaCampCoordinate, addressDictionary: nil)
            let userPlaceMark = MKPlacemark(coordinate: location, addressDictionary: nil)
            let alphaCamp = MKMapItem(placemark: alphaCampMark)
            let userMapItem = MKMapItem(placemark: userPlaceMark)
            let route = [userMapItem,alphaCamp]

            alphaCamp.name = "AlphaCamp總部"
            let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
            
            //開啟地圖開始導航
            MKMapItem.openMapsWithItems(route, launchOptions: options)
        }
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
