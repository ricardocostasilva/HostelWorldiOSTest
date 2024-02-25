//
//  PropertyDetailViewModel.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 20/02/2024.
//

import Foundation
import Combine

// ViewModel responsible for managing Property Detail data
final class PropertyDetailViewModel: ObservableObject {
    
    // Published property for Property Detail model
    @Published var propertyDetail: PropertyDetailModel?
    let propertyID: String
    
    // Set to hold Combine cancellables
    private var cancellables = Set<AnyCancellable>()
    
    let propertiesService: PropertiesServiceProtocol
    
    /// Initialize the view model with a Properties Service Protocol and fetch initial property data.
    /// - Parameter propertiesService: The service responsible for fetching properties.
    init(propertiesService: PropertiesServiceProtocol, propertyID: String) {
        self.propertiesService = propertiesService
        self.propertyID = propertyID
        fetchProperties()
    }
    
    /// Private function to fetch property detail using the properties service.
    private func fetchProperties() {
        propertiesService.getPropertyDetail(propertyId: propertyID)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching property detail: \(error)")
                }
            }, receiveValue: { [weak self] data in
                // Update property detail on successful fetch
                self?.propertyDetail = data
            })
            .store(in: &cancellables) // Store the cancellable for cleanup
    }
    
    /// Public function to trigger fetching property data
    func fetchPropertyData() {
        fetchProperties()
    }
}
