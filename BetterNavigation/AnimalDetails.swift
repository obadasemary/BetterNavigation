//
//  AnimalDetails.swift
//  BetterNavigation
//
//  Created by Abdelrahman Mohamed on 23/09/2024.
//

import SwiftUI

struct AnimalDetails: View {
    
    let animal: Animal
    
    var body: some View {
        VStack {
            Text(animal.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            Image(systemName: animal.image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.red)
        }
        .navigationTitle(animal.name)
        .padding()
    }
}

#Preview {
    
    let animal = Animal(name: "Lion", image: "crown.fill")
    
    AnimalDetails(animal: animal)
}
