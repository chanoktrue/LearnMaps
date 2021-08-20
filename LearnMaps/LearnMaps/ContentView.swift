//
//  ContentView.swift
//  LearnMaps
//
//  Created by Thongchai Subsaidee on 20/8/2564 BE.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.808208, longitude: -122.415802),
        latitudinalMeters: 5000,
        longitudinalMeters: 5000
    )
    
    let annotations = [
        Place(name: "Burger Place", coordinate: CLLocationCoordinate2D(latitude: 37.087920, longitude: -122.422949)),
        Place(name: "Park", coordinate: CLLocationCoordinate2D(latitude: 37.804895, longitude: -122.429654)),
        Place(name: "Tacos", coordinate: CLLocationCoordinate2D(latitude: 37.807319, longitude: -122.421907)),
    
    ]
    
    var rating: String {
        
        return String(format: "%.1f", Double.random(in: 1...5))
    }
    
    var body: some View {
        
//        Map(coordinateRegion: $region  )
        
        Map(coordinateRegion: $region, annotationItems: annotations) { place in

//            MapPin(coordinate: place.coordinate)
            
            MapAnnotation(coordinate: place.coordinate) {
                HStack{
                    
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    
                    Text(rating)
                        .fixedSize()
                }
                .padding(10)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                .overlay(
                    Image(systemName: "arrowtriangle.left.fill")
                        .rotationEffect(Angle(degrees: 270))
                        .foregroundColor(.white)
                        .offset(y: 10)
                    , alignment: .bottom
                    
                )
            }
            
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

