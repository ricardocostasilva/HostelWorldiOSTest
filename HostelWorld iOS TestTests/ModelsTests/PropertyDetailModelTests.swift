//
//  PropertyDetailModelTests.swift
//  HostelWorld iOS TestTests
//
//  Created by ricardo silva on 22/02/2024.
//

import XCTest
@testable import HostelWorld_iOS_Test 

class PropertyDetailModelTests: XCTestCase {
    
    func testCheckInValueInitialization() {
        // Test initialization with string value
        let stringValue = "10:00 AM"
        let checkInWithString = CheckIn.CheckInValue.string(stringValue)
        if case let .string(value) = checkInWithString {
            XCTAssertEqual(value, stringValue)
        } else {
            XCTFail("Failed to initialize CheckInValue with string value")
        }
        
        // Test initialization with integer value
        let intValue = 10
        let checkInWithInt = CheckIn.CheckInValue.int(intValue)
        if case let .int(value) = checkInWithInt {
            XCTAssertEqual(value, intValue)
        } else {
            XCTFail("Failed to initialize CheckInValue with integer value")
        }
    }
    
    
}
