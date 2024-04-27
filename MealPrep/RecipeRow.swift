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
        
        ScrollView(.horizontal){
            
                HStack(spacing: 20){
                    ForEach(0..<5){_ in
                        VStack(){
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
                                .foregroundColor(Color(red: 0.474, green: 0.498, blue: 0.623))
                                .padding(.bottom, 50.0)
                        }
                        
                        
                    }
                    
                
            }
        }
    }
}

#Preview {
    Group{
        RecipeRow(recipe: recipes[0])
        RecipeRow(recipe: recipes[1])
        RecipeRow(recipe: recipes[2])
        RecipeRow(recipe: recipes[3])
       
        
    }
    
}
