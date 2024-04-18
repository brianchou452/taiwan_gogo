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
                        AttractionItemView(item: $viewModel.filteredPOI[index], isShowAddToTripBtn: true)
                    }
                }
                .padding()
            }
        }
    }
}



#Preview {
    AttractionListView()
        .environmentObject(SharedViewModel())
}
