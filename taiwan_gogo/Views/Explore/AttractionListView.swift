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
                    ForEach(viewModel.filteredPOI.indices, id: \.self) { index in
                        AttractionItemView(item: $viewModel.filteredPOI[index])
                    }
                }
                .padding()
            }
        }
    }
}

struct AttractionItemView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var item: PointOfInterest
    @Query private var trips: [Trip]
    @State private var tripSelection: Int = 0

    var body: some View {
        HStack(alignment: .center) {
            NavigationLink(destination: AttractionDetailView(item: $item)) {
                RemoteImageView(url: item.getImages().first?.url)
                    .scaledToFill()
                    .frame(width: 118, height: 118)
                    .mask {
                        RoundedRectangle(cornerRadius: 8)
                    }
                Text(item.getName())
                    .font(.title2)
                    .lineLimit(2)
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

    func addTripAttraction(trip: Trip, attraction: PointOfInterest) {
        trip.attractions.append(
            UserPOI(
                name: attraction.getName(),
                visitDuration: 0,
                dayOfTrip: 0,
                priority: 0,
                details: attraction))
    }
}

#Preview {
    AttractionListView()
        .environmentObject(SharedViewModel())
}
