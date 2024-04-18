//
//  ExploreView.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/13.
//

import MapKit
import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var viewModel: SharedViewModel

    var body: some View {
        Map(position: $viewModel.userPosition) {
            UserAnnotation()
            if $viewModel.filteredPOI.count < 500 {
                ForEach(viewModel.filteredPOI) { poi in
                    switch poi.type {
                    case .attraction:
                        Marker(poi.name,
                               coordinate: CLLocationCoordinate2D(latitude: poi.positionLat, longitude: poi.positionLon))
                            .tint(.orange)
                    case .event:
                        Marker(poi.name,
                               coordinate: CLLocationCoordinate2D(latitude: poi.positionLat, longitude: poi.positionLon))
                            .tint(.indigo)
                    }
                }
            }
        }
        .mapControlVisibility(.automatic)
        .mapControls {
            MapUserLocationButton()
            MapPitchToggle()
        }
        .onAppear {
            viewModel.getAttractions()
            viewModel.getEvents()
            viewModel.requestLocationAuthorisation()
        }
        .onMapCameraChange { context in
            viewModel.visibleRegion = context.region
            viewModel.updatePointOfInterestWithUserLocation()
        }
    }
}

#Preview {
    ExploreView()
        .environmentObject(SharedViewModel())
}
