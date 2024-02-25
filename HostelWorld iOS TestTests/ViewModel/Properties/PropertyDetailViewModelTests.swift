//
//  PropertyDetailViewModelTests.swift
//  HostelWorld iOS TestTests
//
//  Created by ricardo silva on 22/02/2024.
//

import XCTest
import Combine
@testable import HostelWorld_iOS_Test // Import your module here

class PropertyDetailViewModelTests: XCTestCase {

    class MockPropertiesService: PropertiesServiceProtocol {
        func getProperties() -> AnyPublisher<PropertiesObject, Error> {
            // Mock implementation returning a publisher with a mock PropertiesObject
            let mockPropertiesObject = PropertiesObject(properties: [])
            return Just(mockPropertiesObject)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        func getPropertyDetail(propertyId: String) -> AnyPublisher<PropertyDetailModel, Error> {
            // Mock implementation returning a publisher with a mock PropertyDetailModel
            let mockPropertyDetail = PropertyDetailModel(id: propertyId, name: "Mock Property", rating: Rating(overall: 5, atmosphere: 4, cleanliness: 5, facilities: 5, staff: 5, security: 5, location: 4, valueForMoney: 5), bestFor: ["Solo Traveler", "Groups"], description: "A mock property for testing purposes", latitude: "123.456", longitude: "789.012", address1: "123 Mock St", address2: "", directions: "Nearby the mock landmark", city: City(id: "1", name: "Mock City", country: "Mock Country", idCountry: "1"), paymentMethods: ["Credit Card", "Cash"], policies: ["No smoking", "No pets"], totalRatings: "100", images: [], type: "Hostel", depositPercentage: 20, associations: ["Mock Association"], checkIn: CheckIn(startsAt: .string("12:00 PM"), endsAt: .string("11:00 PM")))
            return Just(mockPropertyDetail)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }

    func testGetProperties() {
        let mockService = MockPropertiesService()
        
        let expectation = XCTestExpectation(description: "Properties received")
        
        // Sink to observe updates to properties
        let cancellable = mockService.getProperties()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTFail("Failed to receive properties with error: \(error)")
                }
            }, receiveValue: { propertiesObject in
                expectation.fulfill()
            })
        
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 5)
        
        // Cancel the sink to avoid potential memory leaks
        cancellable.cancel()
    }

    func testGetPropertyDetail() {
        let mockService = MockPropertiesService()
        let propertyId = "1"
        
        let expectation = XCTestExpectation(description: "Property detail received")
        
        // Sink to observe updates to property detail
        let cancellable = mockService.getPropertyDetail(propertyId: propertyId)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTFail("Failed to receive property detail with error: \(error)")
                }
            }, receiveValue: { propertyDetail in
                expectation.fulfill()
            })
        
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 5)
        
        // Cancel the sink to avoid potential memory leaks
        cancellable.cancel()
    }
}

