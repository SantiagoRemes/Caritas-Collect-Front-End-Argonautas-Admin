//
//  MapaView.swift
//  CaritasCollect
//
//  Created by Santiago Remes Inguanzo on 15/10/2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapaView: View {
    @State var latitud: Double = 0.0
    @State var longitud: Double = 0.0
    @State private var region: MKCoordinateRegion = MKCoordinateRegion()
    @State private var locationManager = CLLocationManager()
    
    @State var cities: [Marcador] = [
    Marcador(coordinate: .init(latitude: 25.6503877, longitude: -100.2924652))
    ]
    
    var body: some View {
        
        VStack{
            
            Map(coordinateRegion:$region,
                showsUserLocation: true,
                annotationItems: cities,
                annotationContent: { city in
                MapMarker(coordinate: city.coordinate, tint: .green) })
                .onAppear(){
                    locationManager.requestWhenInUseAuthorization()
                    region = MKCoordinateRegion(center:CLLocationCoordinate2D(latitude: latitud, longitude: longitud),latitudinalMeters: 3000,longitudinalMeters: 3000)
                }
        }.ignoresSafeArea()
    }
}

struct Marcador: Identifiable{
    let id = UUID()
    let coordinate:CLLocationCoordinate2D
}

struct MapaView_Previews: PreviewProvider {
    static var previews: some View {
        MapaView()
    }
}
