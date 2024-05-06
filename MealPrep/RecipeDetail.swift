//
//  RecipeDetail.swift
//  MealPrep
//
//  Created by Giulietta Lee on 24/4/2024.
//

import SwiftUI

struct RecipeDetail: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
           
            RecipeImage(image: recipe.image)
                .offset(y: -100)
                .padding(.bottom, -90)
               

            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.custom("Futura-Bold", size: 25))
                    .padding()

                HStack {
                    Text(recipe.time)
                        .padding(.horizontal)
                    Spacer()
                    Text("Serves \(recipe.serving)")
                        .padding(.horizontal)
                }
                .font(.custom("Futura-Regular", size: 15))
                .foregroundStyle(.secondary)

            
                Text("Equipment")
                    .font(.custom("Futura-Bold", size: 20))
                    .padding()
                    .foregroundColor(Color(red: 0.333, green: 0.780, blue: 0.509))
                
                ForEach(recipe.ingredients.split(separator: ","), id: \.self) { ingredient in
                        Text("• \(ingredient.trimmingCharacters(in: .whitespacesAndNewlines))")
                            .padding(.horizontal)
                            .font(.custom("Futura-Regular", size: 18))
                }
                
                Text("Ingredients")
                        .font(.custom("Futura-Bold", size: 20))
                        .padding()
                        .foregroundColor(Color(red: 0.333, green: 0.780, blue: 0.509))
    
                ForEach(recipe.ingredients.split(separator: ","), id: \.self) { ingredient in
                        Text("• \(ingredient.trimmingCharacters(in: .whitespacesAndNewlines))")
                            .padding(.horizontal)
                            .font(.custom("Futura-Regular", size: 18))
                }
                
                
                Text("Instructions")
                    .font(.custom("Futura-Bold", size: 20))
                    .padding()
                    .foregroundColor(Color(red: 0.333, green: 0.780, blue: 0.509))
                
                ForEach(Array(recipe.instructions.split(separator: ";").enumerated()), id: \.offset) { index, instruction in
                    Text("\(index + 1). \(instruction.trimmingCharacters(in: .whitespacesAndNewlines))")
                        .padding(.horizontal)
                        .padding(3)
                        .font(.custom("Futura-Regular", size: 18))
                }

                
            }
            .padding(.horizontal, 25.0)
        }
      
        //.navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RecipeDetail(recipe: recipes[0])
}
