//
//  PropertiesServiceProtocol.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 19/02/2024.
//

import Foundation
import Combine

protocol PropertiesServiceProtocol {
    func getProperties() -> AnyPublisher<PropertiesObject, Error>
    func getPropertyDetail(propertyId: String) -> AnyPublisher<PropertyDetailModel, Error>
}
