//
//  APIError.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 19/02/2024.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case invalidData
    case decodingError(String)
    case invalidURL
}
