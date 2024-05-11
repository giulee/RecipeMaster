//
//  RecipeRow.swift
//  MealPrep
//
//  Created by Giulietta Lee on 24/4/2024.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: RecipeModel.Recipe
    @ObservedObject var modelData:ModelData
    
    var body: some View {
        VStack{
            //
            VStack(){
                
                recipe.image
                    .resizable()
                    .frame(width: 180, height: 160)
                    .cornerRadius(15)
                
                HStack(){
                    
                    
                    Text(recipe.name)
                        .font(.custom("Futura-Bold", size: 18))
                    
                    if recipe.isFavorite{
                        Image("heartFilled")
                            .multilineTextAlignment(.trailing)
                    }
                }
                
                
                HStack{
                    Image("time")
                        .padding(.bottom, 30.0)
                    
                    Text(recipe.time)
                        .font(.custom("Futura-Regular", size: 15))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(red: 0.474, green: 0.498, blue: 0.623))
                        .padding(.bottom, 30.0)
                    
               
                }
            }
            
        }
    }
}

#Preview {
    Group{
        RecipeRow(recipe: modelData.recipes[0], modelData: ModelData())
        RecipeRow(recipe: modelData.recipes[1], modelData: ModelData())
     
    }
    
}
