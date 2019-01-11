//
//  RutaDetailsViewController.swift
//  Actividad1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 gs. All rights reserved.
//

import UIKit
import MapKit
class RutaDetailsViewController: UIViewController {
    
    var arrayRuta = GetInfoBD.init().GetDataRutas();
    
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var txtDelegacion: UILabel!
    @IBOutlet weak var txtDireccion: UILabel!
    @IBOutlet weak var txtCP: UILabel!
    @IBOutlet weak var txtVisita: UILabel!
    @IBOutlet weak var txtAdeudo: UILabel!
    @IBOutlet weak var txtTiempoAprox: UILabel!
    @IBOutlet weak var txtNotas: UILabel!
    
    var rutas =  GetInfoBD.init().GetDataRutas();
    var empleado : Empleado?
    
   
    override func viewDidLoad() {
      var ruta = arrayRuta[0]
        txtNotas.text = ruta.notas
        txtAdeudo.text = String( ruta.adeudo)
        txtVisita.text =  ruta.pvisitar
        
        
//        let latitude: CLLocationDegrees = 19.4336523
//        let longitude: CLLocationDegrees = -99.1454316
     
        
        let coordinatesOrigen = CLLocationCoordinate2D(latitude: ruta.origen.latitude, longitude: ruta.origen.longitude)
        let annotationOrigen = MKPointAnnotation()
        annotationOrigen.title = "Origen"
        annotationOrigen.subtitle = "Me encuentro aqui."
        annotationOrigen.coordinate = coordinatesOrigen
        map.addAnnotation(annotationOrigen)
        map.selectAnnotation(annotationOrigen, animated: true)
        
       
   

        
        let coordinatesDestino = CLLocationCoordinate2D(latitude:ruta.destino.latitude, longitude:ruta.destino.longitude)
        let annotationDestino = MKPointAnnotation()
        annotationDestino.title = "Destino"
        annotationDestino.subtitle = "Tu cliente"
        annotationDestino.coordinate = coordinatesDestino
        map.addAnnotation(annotationDestino)
        map.selectAnnotation(annotationDestino, animated: true)
        
        let latDelta: CLLocationDegrees = 0.5
        let lonDelta: CLLocationDegrees = 0.5
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let region = MKCoordinateRegion(center: coordinatesOrigen, span: span)
        map.setRegion(region, animated: true)
        
        
        
        let sourcePlacemark = MKPlacemark.init(coordinate: coordinatesOrigen)
        let sourceMapItem = MKMapItem.init(placemark: sourcePlacemark)
        
        let destinationPlacemark = MKPlacemark.init(coordinate: coordinatesDestino)
        let destinationMapItem = MKMapItem.init(placemark: destinationPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate {
            (response, error) -> Void in
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            let route = response.routes[0]
            var x = Double((route.expectedTravelTime) / 60)
            let y = Double(round(x))
            
            
            self.txtTiempoAprox.text = " \(String(y)) Minutos";
            self.map.addOverlay(route.polyline, level: .aboveRoads)
            let rect = route.polyline.boundingMapRect
            self.map.setRegion(MKCoordinateRegion(rect), animated: true)
        }
        
       var geocoder = CLGeocoder();
        geocoder.reverseGeocodeLocation(CLLocation(latitude: ruta.destino.latitude, longitude: ruta.destino.longitude)){(placemarks,error) in
            if error != nil
            {
                print(error)
            }
            if let placemarks = placemarks {
            self.txtCP.text = placemarks[0].postalCode
             self.txtDelegacion.text = placemarks[0].subLocality
                self.txtDireccion.text = placemarks[0].name
            }
            
        }
        
        map.delegate = self
        
        
        
        
        var locationmanager =  CLLocationManager()
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest
//        locationmanager.delegate = self
        locationmanager.requestAlwaysAuthorization()
        locationmanager.startUpdatingLocation()
        locationmanager.distanceFilter = 50
        map.showsUserLocation = true
       
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
       print(empleado)
    }
    
    

}


extension RutaDetailsViewController : MKMapViewDelegate
{
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.orange
        renderer.lineDashPattern = [2,4];
        renderer.lineWidth = 4.0
        renderer.alpha = 1
        return renderer
    }
    
}

//extension RutaDetailsViewController : CLLocationManagerDelegate{
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        //let region = MK
//    }
//}
