//
//  LocationRoute.swift
//  BetterNavigation
//
//  Created by Abdelrahman Mohamed on 02/10/2024.
//

import SwiftUI

enum LocationRoute: Hashable {
    case location
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .location:
            LocationView()
        }
    }
}
