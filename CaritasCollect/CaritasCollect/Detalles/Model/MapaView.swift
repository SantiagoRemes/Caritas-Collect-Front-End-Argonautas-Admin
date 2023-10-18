//
//  MapaView.swift
//  EjemploMapas
//
//  Created by Alumno on 04/10/23.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapaView: View {
    @State var latitud: Double = 0.0
    @State var longitud: Double = 0.0
    @State private var region: MKCoordinateRegion = MKCoordinateRegion()
    @State private var locationManager = CLLocationManager()
    
    @State var cities: [Marcador] = []
    
    var body: some View {
        
        VStack{
            
            Map(coordinateRegion:$region,
                showsUserLocation: true,
                annotationItems: cities,
                annotationContent: { city in
                MapMarker(coordinate: city.coordinate, tint: .green) })
                .onAppear(){
                    locationManager.requestWhenInUseAuthorization()
                    region = MKCoordinateRegion(center:CLLocationCoordinate2D(latitude: latitud, longitude: longitud),latitudinalMeters: 500,longitudinalMeters: 500)
                }
        }.ignoresSafeArea()
            .onAppear(){
                cities.append(Marcador(coordinate: CLLocationCoordinate2D(latitude: latitud, longitude: longitud)))
            }
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
