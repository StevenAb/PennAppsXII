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
import SwiftyJSON
import Foundation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var locationManager: CLLocationManager?
    
    // Map View
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.locationManager = CLLocationManager()
            self.locationManager?.requestWhenInUseAuthorization()
        })
        mapView.setUserTrackingMode(.FollowWithHeading, animated: true)
        
        var url = "https://api.everyblock.com/content/philly/topnews/?token=32c944a5bd390065d49ebada5995e9495aab7d69&schema=crime"
        
        Alamofire.request(.GET, url)
            .responseJSON { (req, res, js, a) in
                let json=JSON( js! )
//                println(json)
//                println(json)
                
                
                    //var addressList = json["results"][index]["location_name"]
                    //println(addressList)
                
                
                    var error: NSError?
                    let jsonData = json["results"]
//                println(jsonData)

                    for (id_thing, result) in jsonData
                    {
                    let address = result["location_name"]
                    var geocoder = CLGeocoder()
                        
                    geocoder.geocodeAddressString(address.string!, completionHandler: {(placemarks: [AnyObject]!, error: NSError!) -> Void in
                        if let placemark = placemarks?[0] as? CLPlacemark {
                        self.mapView.addAnnotation(MKPlacemark(placemark: placemark))
                        }
                    println(error)
                    })
                    }

                        //geocoder.geocodeAddressString(address.string!, completionHandler: {(AnyObject, error) -> Void in
                      //  })
                    //}
//                   let jsonDict = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as NSDictionary
                
                    //var address = "1 Infinite Loop, CA, USA"
                
                
//                (addressList, completionHandler: {(placemarks: [AnyObject]!, error: NSError!) -> Void in
//                        if let placemark = placemarks?[0] as? CLPlacemark {
//                            self.mapView.addAnnotation(MKPlacemark(placemark: placemark))
//                        }
//                        println(error)
//                    })
                //json["results"][]["location_name"].string
                //["results"][10]["location_name"]
        }
        

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