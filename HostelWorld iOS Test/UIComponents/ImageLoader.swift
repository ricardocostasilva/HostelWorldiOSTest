//
//  ImageLoader.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 20/02/2024.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    
    func loadImage(from url: URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] receivedImage in
                self?.image = receivedImage
            }
    }
}
