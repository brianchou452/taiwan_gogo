//
//  PreviewData.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/13.
//

import Foundation
import OSLog

private let logger = Logger()

enum PreviewData {
    static func loadJson<T: Codable>(name: String, completion: @escaping (T?) -> Void) async {
        DispatchQueue.global(qos: .userInteractive).async {
            if let path = Bundle.main.path(forResource: name, ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path))
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let results = try decoder.decode(T.self, from: data)
                    completion(results)
                } catch {
                    logger.error("解析json時發生錯誤: \(error)")
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }
}
