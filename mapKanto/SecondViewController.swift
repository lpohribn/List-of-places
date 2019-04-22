//
//  SecondViewController.swift
//  mapKanto
//
//  Created by Liudmyla POHRIBNIAK on 4/8/19.
//  Copyright © 2019 Liudmyla POHRIBNIAK. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SecondViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var Map: MKMapView!
    let locationManager = CLLocationManager()
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        let anotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "id")

        if (annotation.title ?? "")?.lowercased() == "unit factory" {
            anotationView.markerTintColor = .orange
            anotationView.glyphImage = #imageLiteral(resourceName: "unit")
        }
        else if (annotation.title ?? "")?.lowercased() == "school 21" {
                anotationView.markerTintColor = .black
                anotationView.glyphImage = #imageLiteral(resourceName: "school 42")
        }
        else if (annotation.title ?? "")?.lowercased() == "ecole 42" {
                    anotationView.markerTintColor = .gray
                    anotationView.glyphImage = #imageLiteral(resourceName: "ecole 42")
        }
        else {
            anotationView.markerTintColor = .blue
//            let anotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "id1")
//            let view = UIView(frame: CGRect(x:20, y:20, width:20, height:20))
//            let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
//            view.layer.cornerRadius = 10
//            view.backgroundColor =  .blue
//            scaleAnimation.duration = 2
//            scaleAnimation.repeatCount = 10000
//            scaleAnimation.autoreverses = true
//            scaleAnimation.fromValue = 0.33
//            scaleAnimation.toValue = 1
//
//            anotationView.frame.size.height = 60
//            anotationView.frame.size.width = 60
//            anotationView.layer.cornerRadius = 30
//            anotationView.backgroundColor = UIColor(displayP3Red: 0, green: 0.0, blue: 1, alpha: 0.3)
//
//            anotationView.addSubview(view)
//            anotationView.layer.add(scaleAnimation, forKey: "scale")
//
//            scaleAnimation.duration = 2
//            scaleAnimation.fromValue = 2
//            scaleAnimation.toValue = 1
//            view.layer.add(scaleAnimation, forKey: "scale")
//            return anotationView
        }

        return anotationView
    }
    
    @IBAction func currLocation(_ sender: UIButton) {
        let status  = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined {
           locationManager.requestWhenInUseAuthorization()
            return
        }
        if status == .denied || status == .restricted {
            let alert = UIAlertController(title: "Location was disabled", message: "Please enable location in settings", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            return
        }
        let span = MKCoordinateSpan.init(latitudeDelta: 0.0075, longitudeDelta: 0.0075)
        if let coordinates = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: coordinates, span: span)
            Map.setRegion(region, animated: true)
            Map.showsUserLocation = true
        } else {
            let alert = UIAlertController(title: "Location was disabled", message: "Please enable location in settings", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)

            present(alert, animated: true, completion: nil)
            return
        }
    }
    
    func showLocation(coordinate: CLLocationCoordinate2D) {
        let location = coordinate
        let span = MKCoordinateSpanMake(0.017, 0.017)
        let region = MKCoordinateRegion(center: location, span: span)
        Map.setRegion(region, animated: true)
    }
    
    func addAnnotation(title: String, subtitle: String, coordinate: CLLocationCoordinate2D)
    {
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.subtitle = subtitle
        annotation.coordinate = coordinate
        Map.addAnnotation(annotation)
        showLocation(coordinate: coordinate)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        Map.delegate = self
        let coordinates = CLLocationCoordinate2DMake(50.4689039,30.4620289)
        showLocation(coordinate: coordinates)
        addAnnotation(title: "UNIT Factory", subtitle: "Private school, Unit City", coordinate: coordinates)
    }
    

    @IBAction func mapType(_ sender: UISegmentedControl) {
        switch  sender.titleForSegment(at: sender.selectedSegmentIndex) {
        case "Standard"?:
            self.Map.mapType = .standard
        case "Satelite"?:
            self.Map.mapType = .satellite
        case "Hybrid"?:
            self.Map.mapType = .hybrid
        default:
            return
        }
    }
    
}

