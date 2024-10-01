//
//  BetterNavigationApp.swift
//  BetterNavigation
//
//  Created by Abdelrahman Mohamed on 23/09/2024.
//

import SwiftUI

@main
struct BetterNavigationApp: App {
    
    @State private var selection: AppScreen?
    
    var body: some Scene {
        WindowGroup {
            ContentView(selection: $selection)
        }
    }
}
