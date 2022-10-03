//
//  ViewController.swift
//  UserLocation
//
//  Created by Nguyen Quang Ha on 03/10/2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var location: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        getLocation()
    }
    
    private func getLocation() {
        location = CLLocationManager()
        location?.delegate = self
//        location?.allowsBackgroundLocationUpdates = true
        location?.requestAlwaysAuthorization()
        location?.startUpdatingLocation()
    }
    
    private func addView() {
        locationInfo.frame = CGRect(x: 20, y: view.bounds.height/2 - 100, width: view.bounds.width - 40, height: 120)
        view.addSubview(locationInfo)
    }

    private let locationInfo: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
}

extension ViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationInfo.text = "Lat: \(location.coordinate.latitude) \n Long: \(location.coordinate.longitude)"
        }
    }
}

