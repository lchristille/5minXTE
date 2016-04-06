//
//  VCMapView.swift
//  DiocesiAL
//
//  Created by Luca Christille on 02/04/16.
//  Copyright © 2016 Luca Christille. All rights reserved.
//

import Foundation
import MapKit

extension IndicazioniViewController: MKMapViewDelegate {
    
    internal func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Artwork {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView {
                dequedView.annotation = annotation
                view = dequedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y:5)
                let indicationButton = UIButton()
                indicationButton.setImage(UIImage.init(named: "IndicationsIcon.ico"), forState: .Normal)
                view.rightCalloutAccessoryView = indicationButton
            }
            return view
        }
        return nil
    }
}
