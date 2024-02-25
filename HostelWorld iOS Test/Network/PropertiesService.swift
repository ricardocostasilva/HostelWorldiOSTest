//
//  PropertiesService.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 19/02/2024.
//

import Foundation
import Combine

// Concrete implementation of PropertiesServiceProtocol
class PropertiesService: PropertiesServiceProtocol {
    
    // URLSessionAPIClient instance for making API requests
    var apiClient = URLSessionAPIClient<PropertiesEndPoint>()
    
    // Fetch list of properties
    func getProperties() -> AnyPublisher<PropertiesObject, Error> {
        return apiClient.request(.getProperties)
    }
    
    // Fetch details of a specific property
    func getPropertyDetail(propertyId: String) -> AnyPublisher<PropertyDetailModel, Error> {
        return apiClient.request(.getPropertyDetail(propertyId))
    }
}



