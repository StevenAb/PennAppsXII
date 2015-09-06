//
//  AppLogic.swift
//  PennAppsXII
//
//  Created by Apple on 9/5/15.
//  Copyright (c) 2015 #ilovelin. All rights reserved.
//

import Foundation
import MapKit

class UserLocation: NSObject, MKAnnotation {
    
    let coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
}
