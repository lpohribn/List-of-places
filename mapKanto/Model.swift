//
//  Model.swift
//  mapKanto
//
//  Created by Liudmyla POHRIBNIAK on 4/8/19.
//  Copyright © 2019 Liudmyla POHRIBNIAK. All rights reserved.
//

import Foundation
import MapKit

struct Place {
    var title: String = ""
    var subtitle : String
    var location: CLLocationCoordinate2D
    let color: UIColor
    
    init(title: String, subtitle: String, location: CLLocationCoordinate2D, color: UIColor) {
        self.title = title
        self.subtitle = subtitle
        self.location = location
        self.color = color
    }
}

var arrayOfPlace : [Place] = [Place (title: "UNIT Factory", subtitle: "school that works by innovative standards of French school - Ecole <42>.", location: CLLocationCoordinate2D(latitude: 50.4689039, longitude: 30.4620289), color : UIColor.red), Place(title: "Ecole 42", subtitle: "modern IT school with peer-to-peer system of education", location: CLLocationCoordinate2D(latitude: 48.8965773, longitude: 2.3179449), color : UIColor.green), Place(title: "School 21", subtitle: "school that works by innovative standards of French school - Ecole <42>.", location: CLLocationCoordinate2D(latitude: 55.797124, longitude: 37.5776849), color : UIColor.blue)]
