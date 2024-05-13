//
//  RecipeModel.swift
//  MealPrep
//
//  Created by Giulietta Lee on 24/4/2024.
//

import Foundation
import SwiftUI

class RecipeModel: ModelData{
    struct Recipe: Hashable, Codable, Identifiable {
        var id: Int
        var name: String
        var equipment: String
        var time: String
        var serving: String
        var ingredients: String
        var instructions: String
        var isFavorite: Bool

        private var imageName: String
        var image: Image {
            Image(imageName)
        }
      
    }
    
}

