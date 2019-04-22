//
//  FirstViewController.swift
//  mapKanto
//
//  Created by Liudmyla POHRIBNIAK on 4/8/19.
//  Copyright © 2019 Liudmyla POHRIBNIAK. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController {

    @IBOutlet weak var listOfPlaces: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfPlaces.dataSource = self
        listOfPlaces.delegate = self
        
        self.listOfPlaces.tableFooterView = UIView()
    }
        // Do any additional setup after loading the view, typically from a nib.
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfPlace.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "place")
        cell?.textLabel?.text = arrayOfPlace[indexPath.row].title
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:  false)
        let mapTab = self.tabBarController?.viewControllers![0] as! SecondViewController
        mapTab.addAnnotation(title: arrayOfPlace[indexPath.row].title, subtitle: arrayOfPlace[indexPath.row].subtitle , coordinate: arrayOfPlace[indexPath.row].location)
        self.tabBarController?.selectedIndex = 0
    }
}
