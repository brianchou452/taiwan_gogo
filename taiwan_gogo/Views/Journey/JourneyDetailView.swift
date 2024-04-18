//
//  JourneyDetailView.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/15.
//

import SwiftData
import SwiftUI

struct JourneyDetailView: View {
    @Bindable var trip: Trip

    var body: some View {
        Form {
            TextField("旅程名稱", text: $trip.name)
                .submitLabel(.next)
            TextField("詳細說明", text: $trip.details, axis: .vertical)
            DatePicker("旅程開始日期", selection: $trip.date, displayedComponents: .date)
            Stepper("旅程天數： \(trip.tripDays) 天", value: $trip.tripDays, in: 1 ... 365)

            Section("景點列表") {
                List($trip.pois) { attraction in
                    AttractionItemView(item: attraction, isShowAddToTripBtn: false)
                }
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .navigationTitle("旅程詳細資訊")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Trip.self, configurations: config)
        let example = Trip(name: "日本行", details: "詳細說明的文字")
        return JourneyDetailView(trip: example).modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
