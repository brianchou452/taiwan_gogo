//
//  JourneyListingView.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/15.
//

import SwiftUI
import SwiftData

struct JourneyListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Trip.date, order: .reverse), SortDescriptor(\Trip.name)]) var trips: [Trip]
    
    var body: some View {
        List {
            ForEach(trips) { trip in
                NavigationLink(value: trip) {
                    VStack(alignment: .leading) {
                        Text(trip.name)
                            .font(.headline)
                        
                        Text(trip.date.formatted(.dateTime.year().month().day()))
                    }
                }
            }
            .onDelete(perform: deleteTrip)
        }
    }
    
    init(sort: SortDescriptor<Trip>, searchString: String) {
        _trips = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    func deleteTrip(_ indexSet: IndexSet) {
        for index in indexSet {
            let trip = trips[index]
            modelContext.delete(trip)
        }
    }
}

#Preview {
    JourneyListingView(sort: SortDescriptor(\Trip.name), searchString: "")
}
