//
//  AppScreen.swift
//  BetterNavigation
//
//  Created by Abdelrahman Mohamed on 02/10/2024.
//

import SwiftUI

enum AppScreen: Hashable, Identifiable, CaseIterable {
    
    case animal
    case locations
        
    var id: AppScreen { self }
}

extension AppScreen {
    
    @ViewBuilder
    var label: some View {
        switch self {
        case .animal:
            Label("Animal", systemImage: "pawprint")
        case .locations:
            Label("Locations", systemImage: "location.viewfinder")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .animal:
            AnimalListNavigationStack()
        case .locations:
            LocationsNavigationStackStack()
        }
    }
}
