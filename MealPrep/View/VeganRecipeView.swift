//
//  VeganRecipeView.swift
//  MealPrep
//
//  Created by Giulietta Lee on 2/5/2024.
//

import SwiftUI

struct VeganRecipeView: View {
    var username: String
    @ObservedObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Explore Recipes")
                            .font(.custom("Futura-Bold", size: 40))
                            .padding([.top, .leading, .bottom])
                        HStack{
                            NavigationLink(destination: HomeView(username: username, modelData: ModelData()).navigationBarBackButtonHidden(true), label: {Text("All")})
                                .font(.custom("Futura-Bold", size: 16))
                                .frame(width: 50.0)
                                .frame(height: 45)
                                .textFieldStyle(PlainTextFieldStyle())
                                .overlay(RoundedRectangle(cornerRadius: 100.0).stroke(Color(red: 0.333, green: 0.780, blue: 0.509), lineWidth: 4))
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .cornerRadius(100.0)
                                .padding(.leading, 5.0)
                            
                            Spacer()
                            NavigationLink(destination: VeganRecipeView(username: username, modelData: ModelData()).navigationBarBackButtonHidden(true), label: {Text("vegan")})
                                .font(.custom("Futura-Bold", size: 16))
                                .frame(width:80.0)
                                .frame(height: 45)
                                .textFieldStyle(PlainTextFieldStyle())
                                .overlay(RoundedRectangle(cornerRadius: 100.0).stroke(Color.white))
                                .foregroundColor(Color.white)
                                .background(Color(red: 0.333, green: 0.780, blue: 0.509))
                                .cornerRadius(100.0)
                            
                            
                            Spacer()
                            NavigationLink(destination: GlutenFreeView(username: username, modelData:ModelData()).navigationBarBackButtonHidden(true), label: {Text("gluten free")})
                                .font(.custom("Futura-Bold", size: 16))
                                .frame(width: 120.0)
                                .frame(height: 45)
                                .textFieldStyle(PlainTextFieldStyle())
                                .overlay(RoundedRectangle(cornerRadius: 100.0).stroke(Color(red: 0.333, green: 0.780, blue: 0.509), lineWidth: 4))
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .cornerRadius(100.0)
                            
                            Spacer()
                            NavigationLink(destination: VegetarianView(username: username, modelData:ModelData()).navigationBarBackButtonHidden(true), label: {Text("vegetarian")})
                                .font(.custom("Futura-Bold", size: 16))
                                .frame(width: 115.0)
                                .frame(height: 45)
                                .textFieldStyle(PlainTextFieldStyle())
                                .overlay(RoundedRectangle(cornerRadius: 100.0).stroke(Color(red: 0.333, green: 0.780, blue: 0.509), lineWidth: 4))
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .cornerRadius(100.0)
                                .padding(.trailing, 5.0)
                            
                        }
                        
                        Spacer()
                        FilteredSection(recipes: modelData.recipes.prefix(2))
                        
                        FilteredSection(recipes: modelData.recipes.prefix(4).dropFirst(2))
                        
                        FilteredSection(recipes: modelData.recipes.prefix(14).dropFirst(12))
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 70.0)
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
                            NavigationLink(destination: HomeView(username: username, modelData:ModelData()).navigationBarBackButtonHidden(true), label: {
                                VStack {
                                    Image("homeOpen")
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
                            NavigationLink(destination: SavedRecipesView(username: username, modelData:ModelData()).navigationBarBackButtonHidden(true), label: {
                                VStack{
                                    Image("savedClosed")
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

struct FilteredSection: View {
    //  var title: String
    var recipes: ArraySlice<RecipeModel.Recipe>
    
    var body: some View {
        
        HStack( spacing: 10) {
            ForEach(recipes, id: \.id) { recipe in
                NavigationLink(destination: RecipeDetail(recipe: recipe, modelData:ModelData())) {
                    RecipeRow(recipe: recipe, modelData:ModelData())
                        .foregroundColor(.black)
                        .padding(.leading, 10.0)
                }
            }
        }
    }
}


#Preview {
    VeganRecipeView(username: "", modelData: ModelData())
}
