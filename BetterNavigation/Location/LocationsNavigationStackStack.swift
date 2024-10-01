//
//  LocationsNavigationStackStack.swift
//  BetterNavigation
//
//  Created by Abdelrahman Mohamed on 02/10/2024.
//

import SwiftUI

struct LocationsNavigationStackStack: View {
    
    @State private var routes: [LocationRoute] = []
    
    var body: some View {
        NavigationStack(path: $routes) {
            LocationView()
                .navigationDestination(for: LocationRoute.self) { route in
                    route.destination
                }
        }
        .environment(\.navigate, NavigateAction(action: { route in
            if case let .location(locationRoute) = route {
                routes.append(locationRoute)
            }
        }))
    }
}

#Preview {
    LocationsNavigationStackStack()
}
