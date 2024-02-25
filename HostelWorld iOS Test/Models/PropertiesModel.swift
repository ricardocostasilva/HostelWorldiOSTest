//
//  PropertiesModel.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 19/02/2024.
//

import Foundation

struct PropertiesObject: Codable {
    var properties: [PropertiesModel]
}

struct PropertiesModel: Codable {
    var id: String
    var name: String
    var city: PropertyCity
    var latitude: String
    var longitude: String
    var type: String
    var images: [Images]
    var overallRating: OverallRating
}

struct PropertyCity: Codable {
    var id: String
    var name: String
    var country: String
    var idCountry: String
}

struct Images: Codable, Hashable, Identifiable{
    let id = UUID()
    var image_suffix: String
    var image_prefix: String
    
    enum CodingKeys: String, CodingKey {
        case image_suffix = "suffix"
        case image_prefix = "prefix"
    }
    
    var completeURL: String {
        return image_prefix + image_suffix
    }
}

struct OverallRating: Codable {
    var overall: Int?
    var numberOfRatings: Int?
}

