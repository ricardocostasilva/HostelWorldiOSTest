//
//  SlideShow.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 20/02/2024.
//

import SwiftUI

struct SlideshowView: View {
    let images: [Images]
    @State private var currentIndex = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentIndex) {
                ForEach(images.prefix(6).indices, id: \.self) { index in
                    ImageView(imageData: images[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            PageControl(numberOfPages: min(images.count, 6), currentPage: $currentIndex)
                .padding(.bottom, 10)
        }
    }
}
