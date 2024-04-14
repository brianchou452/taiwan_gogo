//
//  AttractionDetailView.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/14.
//

import SwiftUI

struct AttractionDetailView: View {
    @Binding var item: MOTCAttraction

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.vertical) {
                if item.images?.count ?? 0 > 0 {
                    TabView {
                        ForEach(item.images ?? [], id: \.url) { image in
                            RemoteImageView(url: image.url)
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(idealHeight: 280)
                }

                VStack(alignment: .leading, spacing: 20) {
                    Text(item.attractionName ?? "")
                        .font(.title)
                        .fontWeight(.bold)

                    Text("詳細資訊")
                        .font(.headline)
                    Text(item.description ?? "無資料")
                        .font(.caption)

                    Text("交通資訊")
                        .font(.headline)
                    Text(item.trafficInfo ?? "無資料")
                        .font(.caption)

                    Text("聯絡電話")
                        .font(.headline)
                    Text(item.telephones?.first?.tel ?? "無資料")
                        .font(.caption)

                    Text("最後更新時間：\(item.updateTime?.formatted() ?? "")")
                        .font(.footnote)
                }
                .padding()
            }
        }
        .padding(0)
        .toolbarBackground(.white)
    }
}
