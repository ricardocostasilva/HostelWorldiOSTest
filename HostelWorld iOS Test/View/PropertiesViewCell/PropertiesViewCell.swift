//
//  PropertiesViewCell.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 20/02/2024.
//

import SwiftUI
import Combine

struct PropertiesViewCell: View {
    
    var properties: PropertiesModel
    @StateObject var viewModel: PropertiesViewModel
    @StateObject var imageLoader = ImageLoader()
    @State private var currentIndex = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            SlideshowView(images: properties.images)
                .frame(width: 330, height: 200)
                .padding(.top, 10)
            PropertiesViewCellTextView(text: properties.name, size: 16, font: Constants.Fonts.gillSansSemiBold)
            HStack {
                PropertiesViewCellTextView(text: properties.type, size: 12, font: Constants.Fonts.gillSans)
                PropertiesViewCellTextView(text: properties.city.name, size: 12, font: Constants.Fonts.gillSans)
            }
            HStack {
                Image("ratingStar")                
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                PropertiesViewCellTextView(text: "\(properties.overallRating.overall ?? 0)", size: 16, font: Constants.Fonts.gillSans)
            }
            Spacer()
        }
    }
}



