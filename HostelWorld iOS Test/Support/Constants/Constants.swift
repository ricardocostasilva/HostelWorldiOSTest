//
//  Constants.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 19/02/2024.
//

import Foundation

struct Constants {
    struct APIConstants {
        static var baseUrl = "http://private-anon-7bfd3141f6-practical3.apiary-mock.com"
        static var pathCityProperties = "/cities/1530/properties/"
        static var pathProperty = "/properties/"
    }
    
    struct Colors {
        static var darkCharcoal = "#2C2F33"
    }
    
    struct Fonts {
        static var gillSans = "Gill Sans"
        static var gillSansSemiBold = "GillSans-SemiBold"
    }
    
    struct Labels {
        static var loading = "Loading..."
        static var openInMaps = "Open in Maps"
        static var getDirections = "Get Directions"
        static var readMore = "Read More"
        static var properties = "Properties"
    }
}
