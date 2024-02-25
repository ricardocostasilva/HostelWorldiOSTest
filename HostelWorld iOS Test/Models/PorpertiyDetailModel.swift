//
//  PorpertiyDetailModel.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 20/02/2024.
//

import Foundation

struct PropertyDetailModel: Codable {
    var id: String
    var name: String
    var rating: Rating?
    var bestFor: [String]
    var description: String
    var latitude: String
    var longitude: String
    var address1: String
    var address2: String
    var directions: String
    var city: City
    var paymentMethods: [String]
    var policies: [String]
    var totalRatings: String
    var images: [Images]
    var type: String
    var depositPercentage: Int
    var associations: [String]
    var checkIn: CheckIn
}

struct Rating: Codable{
    var overall: Int
    var atmosphere: Int
    var cleanliness: Int
    var facilities: Int
    var staff: Int
    var security: Int
    var location: Int
    var valueForMoney: Int
}

struct City: Codable {
    var id: String
    var name: String
    var country: String
    var idCountry: String
}

struct CheckIn: Codable {
    var startsAt: CheckInValue
    var endsAt: CheckInValue
    
    enum CheckInValue: Codable {
        case string(String)
        case int(Int)
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let intValue = try? container.decode(Int.self) {
                self = .int(intValue)
            } else if let stringValue = try? container.decode(String.self) {
                self = .string(stringValue)
            } else {
                throw DecodingError.typeMismatch(CheckInValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected String or Int"))
            }
        }
    }
}
