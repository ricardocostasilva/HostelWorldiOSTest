//
//  APIClient.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 19/02/2024.
//

import Foundation
import Combine

// Protocol defining an API endpoint
protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
}

// Enum defining HTTP methods
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

// Protocol defining an API client
protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}

// URLSession-based implementation of APIClient
class URLSessionAPIClient<EndpointType: APIEndpoint>: APIClient {
    
    /// Make a request to the provided API endpoint and return a response as a publisher.
    /// - Parameter endpoint: The API endpoint to request.
    /// - Returns: A publisher for the API response.
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background)) // Perform task on background thread
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .handleEvents(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Decoding error:", error)
                }
            })
            .eraseToAnyPublisher() // Erase publisher type for abstraction
    }
}
