//
//  SavedRecipesView.swift
//  MealPrep
//
//  Created by Giulietta Lee on 29/4/2024.
//

import SwiftUI

struct SavedRecipesView: View {
    
    var username: String
    
    var body: some View {
        NavigationSplitView {
            
            //figure out how to add a navigation bar at the bottom of the screen
            //figure out how to get rid of border
            VStack{
                Text("Saved Recipes")
                    .multilineTextAlignment(.leading)
                    .font(.custom("Futura-Bold", size: 40))
                    .padding(.bottom)
                
                List(recipes) { recipe in
                    NavigationLink {
                        RecipeDetail(recipe: recipe).navigationBarBackButtonHidden(true)
                    } label: {
                        SavedRecipeRow(recipe: recipe)
                    }
                }
                
            }
            
        }
    detail: {
        Text("Select a Recipe")
    }
    }
}

#Preview {
    SavedRecipesView(username: "")
    
}
