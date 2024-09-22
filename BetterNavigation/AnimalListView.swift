//
//  AnimalListView.swift
//  BetterNavigation
//
//  Created by Abdelrahman Mohamed on 23/09/2024.
//

import SwiftUI

struct AnimalListView: View {
    
    @Environment(\.navigate) private var navigate
    
    let animals: [Animal] = [
        Animal(name: "Dog", image: "dog.fill"),
        Animal(name: "Cat", image: "cat.fill"),
        Animal(name: "Lion", image: "crown.fill"),
        Animal(name: "Elephant", image: "pawprint.fill"),
        Animal(name: "Bird", image: "bird.fill"),
        Animal(name: "Fish", image: "fish.fill"),
        Animal(name: "Teddybear", image: "teddybear.fill"),
        Animal(name: "Turtle", image: "tortoise.fill"),
        Animal(name: "Frog", image: "leaf.fill"),
        Animal(name: "Bee", image: "ant.fill"),
        Animal(name: "Rabbit", image: "hare.fill"),
        Animal(name: "Bear", image: "pawprint.fill"),
        Animal(name: "Lizard", image: "lizard.fill")
    ]
    
    var body: some View {
        NavigationView {
            List(animals) { animal in
                HStack(spacing: 8) {
                    Image(systemName: animal.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                    Text(animal.name)
                        .font(.headline)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                }
                .padding(.vertical, 8)
                .contentShape(Rectangle()) // Make the whole row tappable
                .onTapGesture {
                    // Trigger navigation to the detail screen
                    navigate(.animal(.detail(animal)))
                }
            }
            .navigationTitle("Animal List")
        }
    }
}

#Preview {
    
    @Previewable
    @State var routes: [Route] = []
    
    NavigationStack(path: $routes) {
        AnimalListView()
            .navigationDestination(for: Route.self) { route in
                route.destination
            }
            .environment(\.navigate, NavigateAction(action: { route in
                routes.append(route)
            }))
    }
}
