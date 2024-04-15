//
//  SharedViewModel.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/13.
//

import _MapKit_SwiftUI
import Foundation

@MainActor
class SharedViewModel: ObservableObject {
    private var attractions: [MOTCAttraction] = []
    @Published var filteredAttractions: [MOTCAttraction] = []
    private var events: [MOTCEvent] = []
    @Published var filteredEvents: [MOTCEvent] = []

    private var pois: [PointOfInterest] = []
    @Published var filteredPOI: [PointOfInterest] = []

    @Published var userPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @Published var visibleRegion: MKCoordinateRegion?

    private let api = MOTCApiManager.shared

    func getAttractions() {
        Task {
            do {
                attractions = try await api.getAttractions()
                pois.append(contentsOf:
                    attractions.map { attraction -> PointOfInterest in
                        PointOfInterest(type: .attraction, positionLat: attraction.positionLat ?? 0, positionLon: attraction.positionLon ?? 0, attraction: attraction)
                    }
                )
            } catch {
                print("載入景點時發生錯誤 \(error)")
            }
        }
    }

    func getEvents() {
        Task {
            do {
                events = try await api.getEvents()
                pois.append(contentsOf:
                    events.map { event -> PointOfInterest in
                        PointOfInterest(type: .event, positionLat: event.positionLat ?? 0, positionLon: event.positionLon ?? 0, event: event)
                    }
                )
            } catch {
                print("載入活動時發生錯誤 \(error)")
            }
        }
    }

    func updatePointOfInterestWithUserLocation() {
        filteredPOI = pois.filter {
            self.isPointInRegion(longitude: $0.positionLon, latitude: $0.positionLat)
        }
        print("updateAttractionsWithUserLocation")
        print("\(filteredPOI.count)")
    }

    /// 檢查輸入的經緯度是否在目前地圖的範圍內
    private func isPointInRegion(longitude: Double, latitude: Double) -> Bool {
        guard let longitudeCenter = visibleRegion?.center.longitude else {
            return false
        }
        guard let longitudeDelta = visibleRegion?.span.longitudeDelta else {
            return false
        }
        guard let latitudeCenter = visibleRegion?.center.latitude else {
            return false
        }
        guard let latitudeDelta = visibleRegion?.span.longitudeDelta else {
            return false
        }
        if longitude > 0 && latitude > 0 &&
            longitude < longitudeCenter + longitudeDelta && longitude > longitudeCenter - longitudeDelta &&
            latitude < latitudeCenter + latitudeDelta && latitude > latitudeCenter - latitudeDelta
        {
            return true
        }
        return false
    }
}
