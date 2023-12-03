//
//  MapsView.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 02.12.2023.
//

import Foundation
import UIKit
import MapKit



class MapsView: BaseMainView {
    private var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        let coordinateRegion = MKCoordinateRegion(
            center: CLLocation(latitude: 59.941777802971046, longitude: 30.31375456528081).coordinate,
            latitudinalMeters: 2000,
            longitudinalMeters: 2000)
        mapView.setRegion(coordinateRegion, animated: true)
        return mapView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(mapView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension MapsView {
    func setMarker(title: String, latitude: Float, longitude: Float) {
        let marker = MKPointAnnotation()
        marker.title = title
        marker.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
        mapView.addAnnotation(marker)
    }
}
