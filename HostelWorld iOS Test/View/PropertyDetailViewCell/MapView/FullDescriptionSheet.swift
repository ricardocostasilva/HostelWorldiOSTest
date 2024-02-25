//
//  FullDescriptionSheet.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 21/02/2024.
//

import Foundation
import SwiftUI

struct FullDescriptionSheet: View {
    @Environment(\.presentationMode) var presentationMode
    
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                }
            }
            ScrollView {
                Text(description)
                    .padding()
            }
            Spacer()
        }
    }
}
