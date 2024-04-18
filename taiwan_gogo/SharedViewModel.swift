//
//  SharedViewModel.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/13.
//

import _MapKit_SwiftUI
import Foundation
import OSLog

@MainActor
class SharedViewModel: NSObject, ObservableObject {
    private var attractions: [MOTCAttraction] = []
    @Published var filteredAttractions: [MOTCAttraction] = []
    private var events: [MOTCEvent] = []
    @Published var filteredEvents: [MOTCEvent] = []

    private var pois: [PointOfInterest] = []
    @Published var filteredPOI: [PointOfInterest] = []

    @Published var userPosition: MapCameraPosition = .automatic
    @Published var visibleRegion: MKCoordinateRegion?

    private let api = MOTCApiManager.shared
    private let locationManager = CLLocationManager()
    @Published var authorisationStatus: CLAuthorizationStatus = .notDetermined

    private let logger = Logger()

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func getAttractions() {
        Task {
            do {
                attractions = try await api.getAttractions()
                pois.append(contentsOf:
                    attractions.map { attraction -> PointOfInterest in
                        PointOfInterest(attraction: attraction)
                    }
                )
            } catch {
                logger.warning("載入景點時發生錯誤 \(error)")
            }
        }
    }

    func getEvents() {
        Task {
            do {
                events = try await api.getEvents()
                pois.append(contentsOf:
                    events.map { event -> PointOfInterest in
                        PointOfInterest(event: event)
                    }
                )
            } catch {
                logger.warning("載入活動時發生錯誤 \(error)")
            }
        }
    }

    func updatePointOfInterestWithUserLocation() {
        filteredPOI = pois.filter {
            self.isPointInRegion(longitude: $0.positionLon, latitude: $0.positionLat)
        }
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

extension SharedViewModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorisationStatus = manager.authorizationStatus
        switch manager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            userPosition = .userLocation(fallback: .automatic)
        default: break
        }
    }
}
