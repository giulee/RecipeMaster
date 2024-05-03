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
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("My Recipes")
                        .font(.custom("Futura-Bold", size: 40))
                        .padding(.bottom)
                    
                   
                    SavedSection(recipes: recipes.prefix(2))
                    
                    SavedSection( recipes:recipes.prefix(8).dropFirst(4))
                    
                    SavedSection(recipes:recipes.prefix(12).dropFirst(8))
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct SavedSection: View {
   
    var recipes: ArraySlice<Recipe>
    
    var body: some View {
        
        VStack{
            
            HStack( spacing: 10) {
                ForEach(recipes, id: \.id) { recipe in
                    NavigationLink(destination: RecipeDetail(recipe: recipe)) {
                        RecipeRow(recipe: recipe)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}
#Preview {
    SavedRecipesView(username: "")
    
}
