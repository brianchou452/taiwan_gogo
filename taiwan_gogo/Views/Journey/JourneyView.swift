//
//  JourneyView.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/13.
//

import SwiftData
import SwiftUI

struct JourneyView: View {
    @Environment(\.modelContext) var modelContext
    @EnvironmentObject var viewModel: SharedViewModel
    
    @State private var path = [Trip]()
    @State private var sortOrder = SortDescriptor(\Trip.date)
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            JourneyListingView(sort: sortOrder, searchString: searchText)
                .navigationTitle("我的旅程")
                .navigationDestination(for: Trip.self, destination: JourneyDetailView.init)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic))
                .toolbar {
                    Button("新增旅程", systemImage: "plus", action: addTrip)
                
                    Menu("排序", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("名稱")
                                .tag(SortDescriptor(\Trip.name))
                        
                            Text("旅行天數")
                                .tag(SortDescriptor(\Trip.tripDays, order: .reverse))
                        
                            Text("日期")
                                .tag(SortDescriptor(\Trip.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    func addTrip() {
        let trip = Trip()
        modelContext.insert(trip)
        path = [trip]
    }
}

#Preview {
    JourneyView()
}
