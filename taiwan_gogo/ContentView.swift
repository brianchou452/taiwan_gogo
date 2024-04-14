//
//  ContentView.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/12.
//

import MapKit
import SwiftData
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = SharedViewModel()
    @State private var showSheet = false
    @State private var selectedTab = 1

    var body: some View {
        TabView(selection: $selectedTab) {
            ExploreView()
                .environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "location.magnifyingglass")
                    Text("發現")
                }
                .tag(1)

            JourneyView()
                .environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "tray.full")
                    Text("行程")
                }
                .tag(2)
        }
        .task {
            showSheet = true
        }
        .onChange(of: selectedTab) {
            print("selected tab \(selectedTab)")
        }
        .sheet(isPresented: $showSheet) {
            VStack(alignment: .leading) {
                switch selectedTab {
                case 1:
                    AttractionListView()
                        .environmentObject(viewModel)
                case 2:
                    Text("sheet \(selectedTab)")

                default:
                    Text("Error")
                }
            }
            .presentationDetents([.height(60), .medium, .large])
            .presentationCornerRadius(20)
            .presentationBackgroundInteraction(.enabled)
            .interactiveDismissDisabled()
            .bottomMaskForSheet()
        }
    }
}

#Preview {
    ContentView()
}
