//
//  AttractionDetailView.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/14.
//

import SwiftUI

struct AttractionDetailView: View {
    @Binding var item: PointOfInterest

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.vertical) {
                if item.getImages().count > 0 {
                    TabView {
                        ForEach(item.getImages(), id: \.url) { image in
                            RemoteImageView(url: image.url)
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(idealHeight: 280)
                }

                VStack(alignment: .leading, spacing: 20) {
                    Text(item.getName())
                        .font(.title)
                        .fontWeight(.bold)
                    switch item.type {
                    case .attraction:
                        Text("詳細資訊")
                            .font(.headline)
                        Text(item.attraction?.sightsDescription ?? "無資料")
                            .font(.caption)

                        Text("交通資訊")
                            .font(.headline)
                        Text(item.attraction?.trafficInfo ?? "無資料")
                            .font(.caption)

                        Text("聯絡電話")
                            .font(.headline)
                        Text(item.attraction?.telephones?.first?.tel ?? "無資料")
                            .font(.caption)

                        Text("最後更新時間：\(item.attraction?.updateTime?.formatted() ?? "")")
                            .font(.footnote)

                    case .event:
                        Text("詳細資訊")
                            .font(.headline)
                        Text(item.event?.eventDescription ?? "無資料")
                            .font(.caption)

                        Text("時間")
                            .font(.headline)
                        Text("\(item.event?.startDateTime?.formatted() ?? "") ~ \(item.event?.endDateTime?.formatted() ?? "")")
                            .font(.caption)

                        Text("交通資訊")
                            .font(.headline)
                        Text(item.event?.trafficInfo ?? "無資料")

                        Text("聯絡電話")
                            .font(.headline)
                        Text(item.event?.telephones?.first?.tel ?? "無資料")
                            .font(.caption)

                        Text("最後更新時間：\(item.event?.updateTime?.formatted() ?? "")")
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
