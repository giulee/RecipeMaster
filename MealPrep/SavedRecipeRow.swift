//
//  SavedRecipeRow.swift
//  MealPrep
//
//  Created by Giulietta Lee on 29/4/2024.
//

import SwiftUI

struct SavedRecipeRow: View {
    var recipe: RecipeModel.Recipe
    @ObservedObject var modelData:ModelData
    
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

let modelData = ModelData()
#Preview {
    Group {
        SavedRecipeRow(recipe: modelData.recipes[0], modelData: ModelData())
        SavedRecipeRow(recipe: modelData.recipes[1], modelData: ModelData())
        SavedRecipeRow(recipe: modelData.recipes[2], modelData: ModelData())
        SavedRecipeRow(recipe: modelData.recipes[3], modelData: ModelData())
    }
}

