//
//  RemoteImageView.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/14.
//

import SwiftUI
import Kingfisher
import OSLog

private let logger = Logger()

struct RemoteImageView: View {
    var url: URL?
    init(url: String?) {
        guard let url else {
            // 如果沒有提供圖片則使用維基No Image 圖片
            self.url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/390px-No-Image-Placeholder.svg.png")
            return
        }
        self.url = URL(string: url)
    }
    
    var body: some View {
        KFImage
            .url(url)
            .placeholder {
                ProgressView()
            }
            .onFailure { error in
                logger.warning("載入圖片時發生錯誤 : \(error)")
            }
            .resizable()
    }
}
