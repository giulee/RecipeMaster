//
//  SavedRecipesView.swift
//  MealPrep
//
//  Created by Giulietta Lee on 29/4/2024.
//

import SwiftUI

struct SavedRecipesView: View {
    var username: String
    @ObservedObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView {
                    
                    VStack() {
                        Text("My Recipes")
                            .font(.custom("Futura-Bold", size: 40))
                            .padding(.bottom)
                        
                        SavedSection(recipes: modelData.recipes.prefix(2))
                        
                        SavedSection( recipes:modelData.recipes.prefix(8).dropFirst(4))
                        
                        SavedSection(recipes:modelData.recipes.prefix(12).dropFirst(8))
                    }
                    .padding(.bottom, 70)
                }
                VStack(){
                    Spacer()
                    ZStack{
                        Rectangle()
                            .fill(Color.white)
                            .edgesIgnoringSafeArea(.bottom)
                            .frame(height: 90)
                        Spacer()
                        HStack{
                            Spacer()
                            NavigationLink(destination: HomeView(username: username, modelData: ModelData()).navigationBarBackButtonHidden(true), label: {
                                VStack {
                                    Image("homeClosed")
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 10, height: 10)
                                        .padding(.top)
                                    Text("Home")
                                        .padding(.top)
                                        .font(.custom("Futura", size: 16))
                                        .foregroundColor(.black)
                                }
                            })
                            .padding(.top, 10.0)
                            .navigationBarHidden(true)
                            
                            Spacer()
                                .frame(width: 140)
                            NavigationLink(destination: SavedRecipesView(username: username, modelData: ModelData()).navigationBarBackButtonHidden(true), label: {
                                VStack{
                                    Image("savedOpen")
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 10, height: 10)
                                        .padding(.top)
                                    Text("My Recipes")
                                        .padding(.top)
                                        .font(.custom("Futura", size: 16))
                                        .foregroundColor(.black)
                                }
                            })
                            .padding(.top, 10.0)
                            .navigationBarHidden(true)
                            .navigationBarTitle("", displayMode: .inline)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}


struct SavedSection: View {
    
    var recipes: ArraySlice<RecipeModel.Recipe>
    
    var body: some View {
        
        VStack{
            
            HStack( spacing: 10) {
                ForEach(recipes, id: \.id) { recipe in
                    NavigationLink(destination: RecipeDetail(recipe: recipe, modelData:ModelData())) {
                        RecipeRow(recipe: recipe, modelData:ModelData())
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}
#Preview {
    SavedRecipesView(username: "", modelData: ModelData())
    
}
