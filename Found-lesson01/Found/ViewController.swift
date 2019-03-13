/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, MKMapViewDelegate{
    let locationManager = CLLocationManager()

    @IBAction func dropPin(_ sender: UIBarButtonItem) {// drop pin at current location
        let pin = Pin(coordinate: mapView.userLocation.coordinate)
        
        let alert = UIAlertController(title: "Naming Pin", message: "Please put a name to the pin:", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.text = "Name Your Pin"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            pin.title = textField?.text

        }))
        self.present(alert, animated: true, completion: nil)
        mapView.addAnnotation(pin)

    }
    @IBOutlet weak var mapView: MKMapView!
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let width = 1000.0
        let height = 1000.0
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: width, longitudinalMeters: height)
        mapView.setRegion(region, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.setUserTrackingMode(.follow, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        locationManager.requestWhenInUseAuthorization()
       
    }
  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

