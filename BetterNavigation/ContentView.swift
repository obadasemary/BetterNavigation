//
//  ContentView.swift
//  BetterNavigation
//
//  Created by Abdelrahman Mohamed on 23/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var selection: AppScreen?
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppScreen.allCases) { screen in
                screen.destination
                    .tag(screen as AppScreen?)
                    .tabItem { screen.label }
            }
        }
    }
}

#Preview {
    @Previewable @State var selection: AppScreen?
    ContentView(selection: $selection)
}
