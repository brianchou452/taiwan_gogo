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
            if $viewModel.filteredAttractions.count < 500 {
                ForEach(viewModel.filteredAttractions, id: \.attractionID) { attraction in
                    Marker(attraction.attractionName ?? "",
                           coordinate: CLLocationCoordinate2D(latitude: attraction.positionLat ?? 0, longitude: attraction.positionLon ?? 0))
                        .tint(.orange)
                }
            }
        }
        .mapControlVisibility(.automatic)
        .mapControls {
            MapUserLocationButton()
            MapPitchToggle()
        }
        .onMapCameraChange { context in
            viewModel.visibleRegion = context.region
            viewModel.updateAttractionsWithUserLocation()
        }
    }
}

#Preview {
    ExploreView()
        .environmentObject(SharedViewModel())
}
