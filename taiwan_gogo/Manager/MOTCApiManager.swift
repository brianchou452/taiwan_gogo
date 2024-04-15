//
//  MOTCApiManager.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/15.
//

import Foundation

final class MOTCApiManager {
    var getData: (Endpoint) async throws -> Data

    init(getData: @escaping (Endpoint) async throws -> Data) {
        self.getData = getData
    }
}

// MARK: singleton
extension MOTCApiManager {
    static let shared = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return MOTCApiManager { try await session.data(for: $0.request) }
    }()
}

// MARK: interface
extension MOTCApiManager {
    func getAttractions() async throws -> [MOTCAttraction] {
        let result: MOTCAttractionResponse = try await fetch(endpoint: .attractions)
        return result.attractions ?? []
    }

    func getEvents() async throws -> [MOTCEvent] {
        let result: MOTCEventResponse = try await fetch(endpoint: .events)
        return result.events ?? []
    }
}

// MARK: helper
extension MOTCApiManager {
    func fetch<T: Decodable>(endpoint: Endpoint) async throws -> T {
        let data = try await getData(endpoint)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        return try decoder.decode(T.self, from: data)
    }
}

extension MOTCApiManager {
    enum Endpoint {
        case attractions
        case events

        var request: URLRequest {
            switch self {
            case .attractions:
                return URLRequest(url: URL(string: "https://media.taiwan.net.tw/XMLReleaseAll_public/v2.0/Zh_tw/AttractionList.json")!)
            case .events:
                return URLRequest(url: URL(string: "https://media.taiwan.net.tw/XMLReleaseAll_public/v2.0/Zh_tw/EventList.json")!)
            }
        }
    }
}
