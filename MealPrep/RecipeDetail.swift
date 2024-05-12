//
//  RecipeDetail.swift
//  MealPrep
//
//  Created by Giulietta Lee on 24/4/2024.
//

import SwiftUI
import Combine

struct RecipeDetail: View {
    var recipe: RecipeModel.Recipe
    @EnvironmentObject var modelData: ModelData
    @State private var isFavorite:Bool
    
    init(recipe: RecipeModel.Recipe) {
        self.recipe = recipe
        self._isFavorite = State(initialValue: recipe.isFavorite)
    }
    
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
//                        toggleFavorite()
                        modelData.toggleFavorite(recipe: recipe)
//                        modelData.saveChanges()
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
            .onReceive(modelData.objectWillChange) { _ in
                isFavorite = modelData.recipes.first(where: { $0.id == recipe.id })?.isFavorite ?? false
            }
            }
        
        }
    }
    
//    private func toggleFavorite() {
//        if let index = modelData.recipes.firstIndex(where: { $0.id == recipe.id }) {
//            modelData.recipes[index].isFavorite.toggle()
//            modelData.saveChanges()
//        }
//    }
//}

#Preview {
    RecipeDetail(recipe: modelData.recipes[0]).environmentObject(ModelData())
}
