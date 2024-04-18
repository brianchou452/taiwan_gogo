//
//  AttractionDetailView.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/14.
//

import SwiftUI

struct AttractionDetailView: View {
    var item: PointOfInterest

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.vertical) {
                if item.images.count > 0 {
                    TabView {
                        ForEach(item.images, id: \.self) { url in
                            RemoteImageView(url: url)
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(idealHeight: 280)
                }

                VStack(alignment: .leading, spacing: 20) {
                    Text(item.name)
                        .font(.title)
                        .fontWeight(.bold)
                    switch item.type {
                    case .attraction:
                        Text("詳細資訊")
                            .font(.headline)
                        Text(item.poiDescription)
                            .font(.caption)

                        Text("交通資訊")
                            .font(.headline)
                        Text(item.trafficInfo ?? "無資料")
                            .font(.caption)

                        Text("聯絡電話")
                            .font(.headline)
                        Text(item.telephones ?? "無資料")
                            .font(.caption)

                        Text("最後更新時間：\(item.updateTime.formatted())")
                            .font(.footnote)

                    case .event:
                        Text("詳細資訊")
                            .font(.headline)
                        Text(item.poiDescription)
                            .font(.caption)

                        Text("時間")
                            .font(.headline)
                        Text("\(item.startDateTime?.formatted() ?? "") ~ \(item.endDateTime?.formatted() ?? "")")
                            .font(.caption)

                        Text("交通資訊")
                            .font(.headline)
                        Text(item.trafficInfo ?? "無資料")

                        Text("聯絡電話")
                            .font(.headline)
                        Text(item.telephones ?? "無資料")
                            .font(.caption)

                        Text("最後更新時間：\(item.updateTime.formatted())")
                            .font(.footnote)
                    }
                }
                .padding()
            }
        }
        .padding(0)
        .toolbarBackground(.white)
    }
}
