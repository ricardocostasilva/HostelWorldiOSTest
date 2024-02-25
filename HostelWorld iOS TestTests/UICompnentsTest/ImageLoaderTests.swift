//
//  PageControlTests.swift
//  HostelWorld iOS TestTests
//
//  Created by ricardo silva on 22/02/2024.
//

import XCTest
@testable import HostelWorld_iOS_Test // Import your module here

class ImageLoaderTests: XCTestCase {
    
    func testImageLoader() {
        let imageLoader = ImageLoader()
        let expectation = XCTestExpectation(description: "Image loaded")
        
        // Provide a sample image URL for testing
        let imageURL = URL(string: "http://ucd.hwstatic.com/propertyimages/4/40919/4.jpg")!
        
        imageLoader.loadImage(from: imageURL)
        
        // Wait for image loading completion
        let cancellable = imageLoader.$image.sink { image in
            if image != nil {
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 20) // Adjust timeout as needed
        
        // Cancel the sink to avoid potential memory leaks
        cancellable.cancel()
        
        // Verify that the image is loaded
        XCTAssertNotNil(imageLoader.image)
    }
}
