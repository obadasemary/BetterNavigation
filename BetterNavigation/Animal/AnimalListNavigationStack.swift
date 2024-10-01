//
//  AnimalListNavigationStack.swift
//  BetterNavigation
//
//  Created by Abdelrahman Mohamed on 02/10/2024.
//

import SwiftUI

struct AnimalListNavigationStack: View {
    
    @State var routes: [AnimalRoute] = []
    
    var body: some View {
        NavigationStack(path: $routes) {
            AnimalListView()
                .navigationDestination(for: AnimalRoute.self) { route in
                    route.destination
                }
                .environment(\.navigate, NavigateAction(action: { route in
                    if case let .animal(animalRoute) = route {
                        routes.append(animalRoute)
                    }
                }))
        }
    }
}
