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
                .offset(y: -70)
                .padding(.bottom, -80)
               

            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.custom("Futura-Bold", size: 25))
                    .padding()

                HStack {
                    Text(recipe.time)
                        .padding(.horizontal)
                    Spacer()
                    Text(recipe.serving)
                        .padding(.horizontal)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()

                Text("Ingredients")
                    .font(.custom("Futura-Bold", size: 20))
                    .padding()

                Text(recipe.description)
                    .padding(.horizontal)
                    .font(.custom("Futura-Regular", size: 15))
            }
            .padding()
        }
      
        //.navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RecipeDetail(recipe: recipes[0])
}
