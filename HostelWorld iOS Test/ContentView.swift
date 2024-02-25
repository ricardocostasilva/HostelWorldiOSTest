//
//  ContentView.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 19/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: PropertiesViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.cityProperties, id: \.id) { property in
                    ZStack {
                        NavigationLink(destination: PropertyDetailView(propertyID: property.id, propertyDetailViewModel: PropertyDetailViewModel(propertiesService: PropertiesService(), propertyID: property.id) )) {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        PropertiesViewCell(properties: property, viewModel: viewModel)
                            .padding(8) // Adjust padding
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1)
                                    .background(Color(hex: Constants.Colors.darkCharcoal)) // Set background color
                            )
                    }
                    .listRowBackground(Color(hex: Constants.Colors.darkCharcoal)) // Set list row background color
                }
            }
            .refreshable {
                viewModel.fetchPropertiesData()
            }
            .listStyle(PlainListStyle())
            .navigationTitle(Constants.Labels.properties)
            .background(Color(hex: Constants.Colors.darkCharcoal)) // Set background color of the entire view
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .background(Color(hex: Constants.Colors.darkCharcoal)) // Set background color of the navigation view
    }
}

