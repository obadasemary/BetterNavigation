//
//  LocationView.swift
//  BetterNavigation
//
//  Created by Abdelrahman Mohamed on 02/10/2024.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        VStack {
            Image(systemName: "location.north.line")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity)
                .padding()
        }
    }
}

#Preview {
    LocationView()
}
