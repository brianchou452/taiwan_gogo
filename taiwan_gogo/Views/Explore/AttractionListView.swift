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
    @Binding var item: MOTCAttraction

    var body: some View {
        NavigationLink(destination: AttractionDetailView(item: $item)) {
            HStack(alignment: .center) {
                RemoteImageView(url: item.images?.first?.url)
                    .scaledToFill()
                    .frame(width: 118, height: 118)
                    .mask {
                        RoundedRectangle(cornerRadius: 8)
                    }
                Text(item.attractionName ?? "")
                    .font(.title2)
                    .truncationMode(.tail)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    AttractionListView()
        .environmentObject(SharedViewModel())
}
