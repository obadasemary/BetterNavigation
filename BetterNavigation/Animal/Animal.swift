//
//  Animal.swift
//  BetterNavigation
//
//  Created by Abdelrahman Mohamed on 23/09/2024.
//

import Foundation

struct Animal: Identifiable, Hashable {
    
    let id = UUID()
    let name: String
    let image: String
}
