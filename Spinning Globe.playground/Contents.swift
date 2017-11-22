import UIKit
import PlaygroundSupport
import MapKit

class MapViewController:UIViewController {
    var coordinate = CLLocationCoordinate2DMake(0, 0)
    let mapView = MKMapView()
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.frame = view.frame
        view.addSubview(mapView)
        mapView.mapType = .satelliteFlyover
        let camera = MKMapCamera(lookingAtCenter: coordinate, fromDistance: 30000000, pitch: 0, heading: 0)
        mapView.camera = camera
    }
    override func viewDidAppear(_ animated: Bool) {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true ) { (timer) in
            var longitude = self.mapView.camera.centerCoordinate.longitude 
            
            longitude += 1.0
            if longitude > 180 {
                longitude = -180
            }
            self.mapView.centerCoordinate.longitude = longitude
            self.mapView.camera.centerCoordinate.longitude = longitude
        }
    }
}
PlaygroundPage.current.liveView = MapViewController()




