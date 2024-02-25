//
//  MapViewRepresentable.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 21/02/2024.
//

import MapKit
import SwiftUI

struct MapViewRepresentable: UIViewRepresentable {
    let latitudeString: String
    let longitudeString: String

    // Create the underlying MKMapView
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.mapType = .mutedStandard // Set map type
        
        return mapView
    }

    // Update the MKMapView when data changes
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Convert latitude and longitude strings to Double
        guard let latitude = Double(latitudeString), let longitude = Double(longitudeString) else {
            return
        }

        // Create a coordinate from latitude and longitude
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) // Define the span of the map view
        let region = MKCoordinateRegion(center: coordinate, span: span) // Define the region to display
        uiView.setRegion(region, animated: true) // Set the region of the map view
        
        // Add an annotation at the specified coordinate
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        uiView.addAnnotation(annotation)
    }
}

