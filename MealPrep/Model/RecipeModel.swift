//
//  RecipeModel.swift
//  MealPrep
//
//  Created by Giulietta Lee on 24/4/2024.
//

import Foundation
import SwiftUI
import CoreLocation

struct Recipe: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var time: String
    var serving: String

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

  
}
