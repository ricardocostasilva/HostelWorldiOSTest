//
//  URLSessionAPIClientTests.swift
//  HostelWorld iOS TestTests
//
//  Created by ricardo silva on 22/02/2024.
//

import XCTest
import Combine
@testable import HostelWorld_iOS_Test // Import your module here

// Define a mock API client for testing.
class MockAPIClient<EndpointType: APIEndpoint>: URLSessionAPIClient<EndpointType> {
    override func request<T>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> where T : Decodable {
        guard let mockedResponseURL = Bundle(for: type(of: self)).url(forResource: "mockedResponse", withExtension: "json") else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        
        do {
            let mockedResponseData = try Data(contentsOf: mockedResponseURL)
            
            return Just(mockedResponseData)
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { error in
                    // Map any decoding errors
                    return APIError.decodingError(error.localizedDescription)
                }
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: APIError.invalidData).eraseToAnyPublisher()
        }
    }
}

class URLSessionAPIClientTests: XCTestCase {
    
    private var cancellables = Set<AnyCancellable>()

    func testRequestWithMockedData() {
        // Create a mock API client.
        let mockAPIClient = MockAPIClient<PropertiesEndPoint>()

        // Create an instance of PropertiesService.
        let propertiesService = PropertiesService()

        // Set the apiClient property to the mock API client.
        propertiesService.apiClient = mockAPIClient

        // Create your view model with the mock service.
        let viewModel = PropertiesViewModel(propertiesService: propertiesService)

        // Create XCTest expectation to wait for the cityProperties to be received.
        let expectation = XCTestExpectation(description: "City properties received")
        
        // Wait for the expectation to be fulfilled.
        _ = XCTWaiter.wait(for: [expectation], timeout: 1.0)

        // Subscribe to the published cityProperties.
        let cancellable = viewModel.$cityProperties
            .sink(receiveCompletion: { completion in
                // Handle completion
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    // Handle failure
                    XCTFail("Failed to receive city properties with error: \(error)")
                }
            }, receiveValue: { properties in
                // Check if the properties are received correctly.
                XCTAssertEqual(properties.count, 1)
                XCTAssertEqual(properties[0].name, "Mocked Property 1")
                XCTAssertEqual(properties[0].city.name, "Mocked City 1")
                // Fulfill expectation
                expectation.fulfill()
            })

        // Cancel the subscription to avoid memory leaks.
        cancellable.cancel()
    }

}


