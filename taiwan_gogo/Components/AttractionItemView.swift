//
//  AttractionItemView.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/17.
//

import SwiftData
import SwiftUI

struct AttractionItemView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var trips: [Trip]
    @Query private var pois: [PointOfInterest]
    @State private var tripSelection: Int = 0

    @Binding var item: PointOfInterest
    var isShowAddToTripBtn: Bool

    var body: some View {
        HStack(alignment: .center) {
            NavigationLink(destination: AttractionDetailView(item: item)) {
                RemoteImageView(url: item.images.first)
                    .scaledToFill()
                    .frame(width: 118, height: 118)
                    .mask {
                        RoundedRectangle(cornerRadius: 8)
                    }
                Text(item.name)
                    .font(.title2)
                    .lineLimit(2)
                    .truncationMode(.tail)
                Spacer()
            }
            .buttonStyle(PlainButtonStyle())
            if isShowAddToTripBtn {
                addToTripButton(item: item)
            }
        }
    }

    @ViewBuilder
    private func addToTripButton(item: PointOfInterest) -> some View {
        Menu {
            ForEach(trips) { trip in
                Button {
                    addTripAttraction(trip: trip, poi: item)
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

    func addTripAttraction(trip: Trip, poi: PointOfInterest) {
        trip.pois.append(poi)
    }
}
