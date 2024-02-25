//
//  MapView.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 21/02/2024.
//

import SwiftUI

struct MapView: View {
    let latitudeString: String
    let longitudeString: String
    let directions: String
    let cityName: String
    
    @State private var isShowingInfo = false
    
    var body: some View {
        VStack {
            MapViewRepresentable(latitudeString: latitudeString, longitudeString: longitudeString)
                .edgesIgnoringSafeArea(.all)
                .conditionalButton(isVisible: !directions.isEmpty) {
                    Button(action: {
                        self.isShowingInfo = true
                    }) {
                        PropertiesViewCellTextView(text: Constants.Labels.getDirections, size: 14, font: Constants.Fonts.gillSans)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color(hex: Constants.Colors.darkCharcoal))
                            .cornerRadius(10)
                    }
                    .padding(16)
                }
        }
        .navigationBarTitle(cityName, displayMode: .inline)
        .navigationBarItems(trailing: EmptyView()) // Hide navigation bar items
        .sheet(isPresented: $isShowingInfo) {
            InfoView(directions: directions, isShowingInfo: $isShowingInfo)
        }
    }
}
