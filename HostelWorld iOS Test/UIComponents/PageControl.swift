//
//  PageControl.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 20/02/2024.
//

import SwiftUI

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfPages, id: \.self) { page in
                Circle()
                    .fill(page == currentPage ? Color.white : Color.gray)
                    .frame(width: 8, height: 8)
                    .padding(4)
                    .onTapGesture {
                        currentPage = page
                    }
            }
        }
    }
}


