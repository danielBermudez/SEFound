//
//  Pin.swift
//  Found
//
//  Created by Daniel Bermudez on 3/13/19.
//  Copyright © 2019 Your School. All rights reserved.
//

import Foundation
import MapKit
class Pin : NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    init(coordinate: CLLocationCoordinate2D){
        self.coordinate = coordinate
    }
    
}
