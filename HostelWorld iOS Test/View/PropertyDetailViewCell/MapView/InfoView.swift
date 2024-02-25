//
//  InfoView.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 21/02/2024.
//

import SwiftUI

struct InfoView: View {
    let directions: String
    @Binding var isShowingInfo: Bool

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    isShowingInfo = false // Close the sheet when the button is tapped
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                }
            }
            PropertiesViewCellTextView(text: directions, size: 20, font: Constants.Fonts.gillSansSemiBold)
            
            Spacer()
        }
    }
}
