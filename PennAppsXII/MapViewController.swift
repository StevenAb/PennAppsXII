//
//  MapViewController.swift
//  PennAppsXII
//
//  Created by Apple on 9/5/15.
//  Copyright (c) 2015 #ilovelin. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var locationManager: CLLocationManager?
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.locationManager = CLLocationManager()
            self.locationManager?.requestWhenInUseAuthorization()
        })
        mapView.setUserTrackingMode(.FollowWithHeading, animated: true)


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if (status == .AuthorizedWhenInUse) {
            mapView.setUserTrackingMode(.FollowWithHeading, animated: true)
        }
    }

}
