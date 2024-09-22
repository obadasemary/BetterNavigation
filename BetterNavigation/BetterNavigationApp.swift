//
//  BetterNavigationApp.swift
//  BetterNavigation
//
//  Created by Abdelrahman Mohamed on 23/09/2024.
//

import SwiftUI

@main
struct BetterNavigationApp: App {
    
    @State private var routes: [Route] = []
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $routes) {
                ContentView()
                    .navigationDestination(for: Route.self) { route in
                        route.destination
                    }
            }.environment(\.navigate, NavigateAction(action: { route in
                routes.append(route)
            }))
        }
    }
}
