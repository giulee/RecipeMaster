//
//  RecipeDetail.swift
//  MealPrep
//
//  Created by Giulietta Lee on 24/4/2024.
//

import SwiftUI

struct RecipeDetail: View {
    @State var recipe: Recipe
    
    var body: some View {
        ScrollView {
            
            RecipeImage(image: recipe.image)
                .offset(y: -100)
                .padding(.bottom, -90)
            
            
            VStack(alignment: .leading) {
                HStack{
                    Text(recipe.name)
                        .font(.custom("Futura-Bold", size: 25))
                        .padding()
                    Spacer()
                    Button(action:{
                        recipe.isFavorite.toggle()
                    }){
                        Image(recipe.isFavorite ? "heartFilled" : "heart")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                    }
                }
                
                HStack {
                    Image("time")
                        .padding(.leading)
                    Text(recipe.time)
                    
                    Spacer()
                    Image("people")
                    Text("Serves \(recipe.serving)")
                        .padding(.trailing)
                }
                .font(.custom("Futura", size: 17))
                .foregroundStyle(.secondary)
                
                
                HStack{
                    Text("Equipment")
                        .font(.custom("Futura-Bold", size: 22))
                        .padding()
                        .foregroundColor(Color(red: 0.333, green: 0.780, blue: 0.509))
                    
                    Image("equipment")
                        .resizable()
                        .frame(width: 33, height: 33)
                }
                ForEach(recipe.equipment.split(separator: ","), id: \.self) { ingredient in
                    Text("• \(ingredient.trimmingCharacters(in: .whitespacesAndNewlines))")
                        .padding(.horizontal)
                        .padding(.bottom, 2.0)
                        .font(.custom("Futura", size: 20))
                }
                
                HStack{
                    Text("Ingredients")
                        .font(.custom("Futura-Bold", size: 22))
                        .padding()
                        .foregroundColor(Color(red: 0.333, green: 0.780, blue: 0.509))
                    Image("ingredients")
                        .resizable()
                        .frame(width: 33, height: 33)
                }
                
                ForEach(recipe.ingredients.split(separator: ","), id: \.self) { ingredient in
                    Text("• \(ingredient.trimmingCharacters(in: .whitespacesAndNewlines))")
                        .padding(.horizontal)
                        .padding(.bottom, 2.0)
                        .font(.custom("Futura", size: 20))
                }
                
                HStack{
                    Text("Instructions")
                        .font(.custom("Futura-Bold", size: 22))
                        .padding()
                        .foregroundColor(Color(red: 0.333, green: 0.780, blue: 0.509))
                    
                    Image("instructions")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                
                
                ForEach(Array(recipe.instructions.split(separator: ";").enumerated()), id: \.offset) { index, instruction in
                    Text("\(index + 1). \(instruction.trimmingCharacters(in: .whitespacesAndNewlines))")
                        .padding(.horizontal)
                        .padding(.bottom, 2.0)
                        .font(.custom("Futura", size: 20))
                }
                
            }
            .padding(.horizontal, 25.0)
        }
    }
}

#Preview {
    RecipeDetail(recipe: recipes[0])
}
