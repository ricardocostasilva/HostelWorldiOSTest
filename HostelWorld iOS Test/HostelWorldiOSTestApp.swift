//
//  HostelWorldiOSTestApp.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 19/02/2024.
//

import SwiftUI

@main
struct HostelWorldiOSTestApp: App {
    var body: some Scene {
        WindowGroup {
            let propertiesViewModel = PropertiesViewModel(propertiesService: PropertiesService())
            ContentView(viewModel: propertiesViewModel)
                .background(Color(hex: Constants.Colors.darkCharcoal))
                .preferredColorScheme(.dark)
        }
    }
}
