//
//  PropertiesViewModel.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 20/02/2024.
//

import Foundation
import Combine

// ViewModel responsible for managing Properties data
final class PropertiesViewModel: ObservableObject {
    
    // Published property for city properties
    @Published var cityProperties: [PropertiesModel] = []
    
    // Set to hold Combine cancellables
    private var cancellables = Set<AnyCancellable>()
    
    let propertiesService: PropertiesServiceProtocol
    
    /// Initialize the view model with a properties service and fetch initial properties data.
    /// - Parameter propertiesService: The service responsible for fetching properties.
    init(propertiesService: PropertiesServiceProtocol) {
        self.propertiesService = propertiesService
        fetchPropertiesData() // Fetch initial properties data
    }
    
    /// Private function to fetch properties using the properties service.
    private func fetchProperties() {
        propertiesService.getProperties()
            .receive(on: RunLoop.main) 
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching properties: \(error)")
                }
            }, receiveValue: { [weak self] data in
                // Update city properties on successful fetch
                self?.cityProperties = data.properties
            })
            .store(in: &cancellables) // Store the cancellable for cleanup
    }
    
    /// Public function to trigger fetching properties data
    func fetchPropertiesData() {
        fetchProperties()
    }
}
