//
//  AttractionListView.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/13.
//

import SwiftUI

struct AttractionListView: View {
    @EnvironmentObject var viewModel: SharedViewModel

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.filteredAttractions, id: \.attractionID){ attraction in
                    Text(attraction.attractionName ?? "")
                }
            }
        }
    }
}

#Preview {
    AttractionListView()
        .environmentObject(SharedViewModel())
}
