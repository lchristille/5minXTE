//
//  IndicazioniViewController.swift
//  DiocesiAL
//
//  Created by Luca Christille on 25/03/16.
//  Copyright © 2016 Luca Christille. All rights reserved.
//

import UIKit
import MapKit

class IndicazioniViewController: UIViewController {
    
    @IBOutlet weak var mappa: MKMapView!
    
    let initialLocation = CLLocation(latitude: 44.9103781, longitude: 8.6122585)
    let regionRadius = CLLocationDistance(200)
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mappa.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mappa.delegate = self
        
        let artwork = Artwork(title: "5 min X TE", locationName:"Chiesa di San Giovannino", discipline: "Chiesa", coordinate: CLLocationCoordinate2D(latitude: 44.9103781, longitude: 8.6122585))
        
        mappa.addAnnotation(artwork)
        
        centerMapOnLocation(initialLocation)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
