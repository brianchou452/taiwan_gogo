//
//  AttractionListView.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/13.
//

import SwiftData
import SwiftUI

struct AttractionListView: View {
    @EnvironmentObject var viewModel: SharedViewModel

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(viewModel.filteredAttractions.indices, id: \.self) { index in
                        AttractionItemView(item: $viewModel.filteredAttractions[index])
                    }
                }
                .padding()
            }
        }
    }
}

struct AttractionItemView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var item: MOTCAttraction
    @Query private var trips: [Trip]
    @State private var tripSelection: Int = 0

    var body: some View {
        HStack(alignment: .center) {
            NavigationLink(destination: AttractionDetailView(item: $item)) {
                RemoteImageView(url: item.images?.first?.url)
                    .scaledToFill()
                    .frame(width: 118, height: 118)
                    .mask {
                        RoundedRectangle(cornerRadius: 8)
                    }
                Text(item.attractionName ?? "")
                    .font(.title2)
                    .truncationMode(.tail)
                Spacer()
            }
            .buttonStyle(PlainButtonStyle())
            Menu {
                ForEach(trips) { trip in
                    Button {
                        addTripAttraction(trip: trip, attraction: item)
                    } label: {
                        Text(trip.name)
                    }
                }
            } label: {
                Image(systemName: "tray.and.arrow.down")
            }
            .buttonStyle(PlainButtonStyle())
            .padding()
        }
    }

    func addTripAttraction(trip: Trip, attraction: MOTCAttraction) {
        trip.attractions.append(
            Attraction(
                name: attraction.attractionName ?? "",
                visitDuration: .zero,
                dayOfTrip: 0,
                priority: 0,
                motcAttractionID: attraction.attractionID ?? "",
                positionLat: attraction.positionLat ?? 0,
                positionLon: attraction.positionLon ?? 0))
    }
}

#Preview {
    AttractionListView()
        .environmentObject(SharedViewModel())
}
