//
//  ViewController.swift
//  Google Maps Basics
//
//  Created by Zülal Nebin on 13.11.2026.
//

import UIKit
import GoogleMaps
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var googleMapView: GMSMapView!
    @IBOutlet weak var appleMapView: MKMapView!
    @IBOutlet weak var mapTypeSegment: UISegmentedControl!
    
    let latitude = 41.012102
    let longitude = 28.981644
    let zoom: Float = 14.0
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        googleMapView.isHidden = false
        appleMapView.isHidden = true
        
        setupGoogleMap()
    }
    
    
    @IBAction func mapTypeChanged(_ sender: UISegmentedControl) {
        let isGoogleMaps = sender.selectedSegmentIndex == 0
        
        googleMapView.isHidden = !isGoogleMaps
        appleMapView.isHidden = isGoogleMaps
        
        if !isGoogleMaps {
            if locationManager == nil {
                setupAppleMap()
            } else if locationManager.authorizationStatus == .denied ||
                        locationManager.authorizationStatus == .restricted {
                showLocationPermissionAlert()
            }
        }
    }
    
    func setupGoogleMap() {
        googleMapView.camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: zoom)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        marker.title = "Topkapı Sarayı"
        marker.snippet = "İstanbul"
        
        marker.map = googleMapView
    }
    
    func setupAppleMap() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
            
        case .denied, .restricted:
            showLocationPermissionAlert()
            
        case .notDetermined:
            break
            
        @unknown default:
            showLocationPermissionAlert()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let coordinate = location.coordinate
        
        let annotation = MapAnnotation(coordinate: coordinate)
        appleMapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 2500,
            longitudinalMeters: 2500
        )
        
        appleMapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Location error: \(error.localizedDescription)")
    }
    
    func showLocationPermissionAlert() {
        let alert = UIAlertController(
            title: "Konum İzni Gerekli",
            message: "Apple Maps özelliğini kullanabilmek için konum izni vermelisin.",
            preferredStyle: .alert
        )
        
        let settingsAction = UIAlertAction(title: "Ayarları Aç", style: .default, handler: openAppSettings)
        
        let cancelAction = UIAlertAction(title: "Vazgeç", style: .cancel) { _ in
            self.mapTypeSegment.selectedSegmentIndex = 0
            self.mapTypeChanged(self.mapTypeSegment)
        }
        
        alert.addAction(cancelAction)
        alert.addAction(settingsAction)
        
        present(alert, animated: true)
    }
    
    func openAppSettings(alert: UIAlertAction) {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
        
        UIApplication.shared.open(settingsURL) { success in
            if !success {
                print("Ayarlar açılamadı.")
            }
        }
    }
    
    
}

class MapAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
