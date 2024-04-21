//
//  MapKitVc.swift
//  MediaFinder
//
//  Created by ihab saad on 12/03/2024.
//

import MapKit

protocol MessageLocationProtocol{
    func messageProtocol(message: String)
}

class MapKitVc: UIViewController {
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
//    MARK: - OutLets
    @IBOutlet weak var mabView: MKMapView!
    @IBOutlet weak var locationLabel: UILabel!
    
//    MARK: - Prooerties
    var locaitonManger = CLLocationManager()
    var delegate: MessageLocationProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        checkLocationServices()
        mabView.delegate = self
    }
    
    @IBAction func backMessage(_ sender: Any) {
        delegate?.messageProtocol(message: locationLabel.text ?? "")
        self.dismiss(animated: true)
    }
    
}
extension MapKitVc: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let lat = mapView.centerCoordinate.latitude
        let long = mapView.centerCoordinate.longitude
        let lection = CLLocation(latitude: lat, longitude: long)
        getAddressName(loction: lection)
    }
    
  private func getAddressName(loction: CLLocation) {
       let Geocoder =  CLGeocoder()
           Geocoder.reverseGeocodeLocation(loction) { placeFirst, error in
        if let error = error {
              print(error.localizedDescription)
          } else if let placeFirst = placeFirst?.first {
              self.locationLabel.text = placeFirst.compactAddress
          }
      }
    }
    
    func checkLocationServices(){
        
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorisation()
        } else {
            print("Please, Open Location Services (GPS)")
        }
    }
    
    
    private func getloction() {
      let location = CLLocation(latitude: 31.0409, longitude: 31.3785)
      let region = MKCoordinateRegion(center: location.coordinate,
                                    latitudinalMeters: 10000,
                                    longitudinalMeters: 10000)
        mabView.setRegion(region, animated: true)
        getAddressName(loction: location)
    }

    
    func checkLocationAuthorisation()  {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            getloction()
        case .restricted, .denied:
            print("Can Not Get Your Location!")
        case .notDetermined:
            locaitonManger.requestWhenInUseAuthorization()
        default:
            print("")
        }
    }
}
