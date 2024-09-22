//
//  AnimalRoute.swift
//  BetterNavigation
//
//  Created by Abdelrahman Mohamed on 23/09/2024.
//

import SwiftUI

enum AnimalRoute: Hashable {
    case list
    case detail(Animal)
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .list:
            AnimalListView()
        case .detail(let animal):
            AnimalDetails(animal: animal)
        }
    }
}
