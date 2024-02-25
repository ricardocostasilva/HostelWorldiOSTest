//
//  PropertiesViewCellTextView.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 20/02/2024.
//

import Foundation
import SwiftUI

struct PropertiesViewCellTextView: View {
    
    let text: String
    let size: CGFloat
    let font: String
    
    var body: some View {
        Text(text)
            .font(.custom(font, size: size))
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
    }
}

