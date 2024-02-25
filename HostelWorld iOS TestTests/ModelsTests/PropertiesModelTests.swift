//
//  PropertiesModelTests.swift
//  HostelWorld iOS TestTests
//
//  Created by ricardo silva on 22/02/2024.
//

import Foundation

import XCTest
@testable import HostelWorld_iOS_Test

class PropertiesModelTests: XCTestCase {
    
    func testCompleteImageURL() {
        let images = Images(image_suffix: ".jpg", image_prefix: "http://ucd.hwstatic.com/propertyimages/4/40919/4")
        XCTAssertEqual(images.completeURL, "http://ucd.hwstatic.com/propertyimages/4/40919/4.jpg")
    }
    
    func testOverallRatingInitialization() {
        let overallRating = OverallRating(overall: 4, numberOfRatings: 100)
        XCTAssertEqual(overallRating.overall, 4)
        XCTAssertEqual(overallRating.numberOfRatings, 100)
    }
    
    // Add more test cases as needed for other functionalities
    
}
