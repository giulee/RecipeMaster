//
//  RecipeRow.swift
//  MealPrep
//
//  Created by Giulietta Lee on 24/4/2024.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe
    
    var body: some View {
        HStack {
            
            VStack{
                recipe.image
                    .resizable()
                    .frame(width: 180, height: 160)
                    .cornerRadius(15)
                
                
                Text(recipe.name)
                    .font(.custom("Futura-Bold", size: 18))
                    .multilineTextAlignment(.leading)
                
                Text(recipe.time)
                    .font(.custom("Futura-Regular", size: 15))
                    .multilineTextAlignment(.leading)
                
                
            }
            
            
            // Spacer()
        }
    }
}

#Preview {
    Group{
        RecipeRow(recipe: recipes[0])
        RecipeRow(recipe: recipes[1])
    }
    
}
