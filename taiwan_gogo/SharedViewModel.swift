//
//  SharedViewModel.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/13.
//

import _MapKit_SwiftUI
import Foundation

class SharedViewModel: ObservableObject {
    var attractionResponse: MOTCAttractionResponse?
    @Published var attractions: [MOTCAttraction] = []
    @Published var userPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @Published var filteredAttractions: [MOTCAttraction] = []
    @Published var visibleRegion: MKCoordinateRegion?

    actor AttractionResponseActor {
        var AttractionResponse = MOTCAttractionResponse?.self

        func setResponse(newData: MOTCAttractionResponse?.Type) {
            AttractionResponse = newData
        }
    }

    func getAttractions() {
        // TODO: 改成呼叫API
        Task {
            await PreviewData.loadJson(name: "AttractionList") { [weak self] (response: MOTCAttractionResponse?) in
                DispatchQueue.main.sync { [weak self] in
                    self?.attractionResponse = response
                    self?.attractions = response?.attractions ?? []
                }
            }
        }
    }

    func updateAttractionsWithUserLocation() {
        filteredAttractions = attractions.filter {
            self.isPointInRegion(longitude: $0.positionLon ?? 0, latitude: $0.positionLat ?? 0)
        }
        print("updateAttractionsWithUserLocation")
        print("\(filteredAttractions.count)")
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
