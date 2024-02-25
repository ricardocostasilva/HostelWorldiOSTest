//
//  PropertyDetailView.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 20/02/2024.
//

import SwiftUI
import Combine

struct PropertyDetailView: View {
    
    let propertyID: String
    @StateObject var propertyDetailViewModel: PropertyDetailViewModel
    
    @State private var isShowingFullDescription = false
    
    var body: some View {
            if let propertyDetail = propertyDetailViewModel.propertyDetail {
                VStack(alignment: .leading, spacing: 10) {
                    SlideshowView(images: propertyDetail.images)
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .padding(.top, 10)
                    PropertiesViewCellTextView(text: propertyDetail.name, size: 20, font: Constants.Fonts.gillSansSemiBold)
                        .padding()
                    HStack {
                        PropertiesViewCellTextView(text: propertyDetail.address1, size: 16, font: Constants.Fonts.gillSans)
                        PropertiesViewCellTextView(text: propertyDetail.address2, size: 16, font: Constants.Fonts.gillSans)
                        
                        NavigationLink(destination: MapView(latitudeString: propertyDetail.latitude, longitudeString: propertyDetail.longitude, directions: propertyDetail.directions, cityName: propertyDetail.city.name)) {
                            Text(Constants.Labels.openInMaps)
                        }
                    }
                    .padding()
                    HStack {
                        PropertiesViewCellTextView(text: propertyDetail.city.name, size: 16, font: Constants.Fonts.gillSans)
                        PropertiesViewCellTextView(text: propertyDetail.city.country, size: 16, font: Constants.Fonts.gillSans)
                    }
                    .padding()
                    // Displaying a portion of the description
                    VStack {
                        HStack {
                            PropertiesViewCellTextView(text: propertyDetail.description, size: 16, font: Constants.Fonts.gillSans)
                                .lineLimit(3)
                            
                            Spacer() // Add spacer to push the button to the right
                        }
                        
                        Button(action: {
                            isShowingFullDescription = true
                        }) {
                            HStack {
                                Text(Constants.Labels.readMore)
                                    .font(.custom(Constants.Fonts.gillSans, size: 12))
                                Image(systemName: "chevron.right")
                            }
                            .foregroundColor(.white)
                            .padding(.top, 5)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing) // Align button to the trailing edge
                        .sheet(isPresented: $isShowingFullDescription) {
                            FullDescriptionSheet(description: propertyDetail.description)
                        }
                    }
                    .padding()
                    Spacer() // Push content to the top
                }
                .background(Color(hex: Constants.Colors.darkCharcoal))
                .navigationBarTitle(propertyDetail.name) // Set navigation bar title
                .navigationBarTitleDisplayMode(.inline)
            }
        
    }
}

