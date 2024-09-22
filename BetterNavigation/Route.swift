//
//  Route.swift
//  BetterNavigation
//
//  Created by Abdelrahman Mohamed on 23/09/2024.
//

import SwiftUI

enum Route: Hashable {
    case animal(AnimalRoute)
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .animal(let animalRoute):
            animalRoute.destination
        }
    }
}
