//
//  ImageView.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 20/02/2024.
//

import SwiftUI

struct ImageView: View {
    @StateObject var imageLoader: ImageLoader
    let imageData: Images
    let imageSize: CGSize
    let cornerRadius: CGFloat
    
    init(imageData: Images, imageSize: CGSize = CGSize(width: 330, height: 200), cornerRadius: CGFloat = 10) {
        self.imageData = imageData
        self._imageLoader = StateObject(wrappedValue: ImageLoader())
        self.imageSize = imageSize
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        Group {
            if let imageURL = URL(string: imageData.completeURL) {
                if let image = imageLoader.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: imageSize.width, height: imageSize.height)
                        .cornerRadius(cornerRadius)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius) // Placeholder rounded rectangle
                        .fill(Color.gray)
                        .frame(width: imageSize.width, height: imageSize.height)
                        .overlay(Text(Constants.Labels.loading).foregroundColor(.white))
                        .onAppear {
                            imageLoader.loadImage(from: imageURL)
                        }
                }
            }
        }
    }
}
