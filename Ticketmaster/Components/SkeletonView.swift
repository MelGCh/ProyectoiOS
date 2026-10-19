//
//  SkeletonView.swift
//  Ticketmaster
//

import SwiftUI

// Los cuadros grises que se ven mientras cargan los eventos
struct SkeletonView: View {

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.gray.opacity(0.4))
                .frame(height: 180)
                .padding(.horizontal)
                .padding(.top, 20)

            ForEach(0..<3) { _ in
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 100)
                    .padding(.horizontal)
                    .padding(.top, 10)
            }
        }
    }
}

#Preview {
    SkeletonView()
}
