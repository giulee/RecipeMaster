//
//  SavedRecipeRow.swift
//  MealPrep
//
//  Created by Giulietta Lee on 29/4/2024.
//

import SwiftUI

struct SavedRecipeRow: View {
    var recipe: Recipe
    
    var body: some View {
       
        HStack(){
                
                recipe.image
                    .resizable()
                    .frame(width: 150, height: 130)
                    .cornerRadius(15)
                    .padding(10.0)
                
                VStack{
                    Text(recipe.name)
                        .font(.custom("Futura-Bold", size: 18))
                        .multilineTextAlignment(.leading)
                        
                    
                    Text(recipe.time)
                        .font(.custom("Futura-Regular", size: 15))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(red: 0.474, green: 0.498, blue: 0.623))
                }
                 
            }
             
        }
    }

#Preview {
    Group{
        SavedRecipeRow(recipe: recipes[0])
        SavedRecipeRow(recipe: recipes[1])
        SavedRecipeRow(recipe: recipes[2])
        SavedRecipeRow(recipe: recipes[3])
    }
}
