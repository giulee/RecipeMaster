//
//  HomeView.swift
//  MealPrep
//
//  Created by Giulietta Lee on 24/4/2024.
//

import SwiftUI

struct HomeView: View {
    var username: String
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Explore Recipes")
                            .font(.custom("Futura-Bold", size: 40))
                            .padding([.top, .leading, .bottom])
                        HStack{
                            NavigationLink(destination: HomeView(username: username).navigationBarBackButtonHidden(true), label: {Text("All")})
                                .font(.custom("Futura-Bold", size: 16))
                                .frame(width: 50.0)
                                .frame(height: 45)
                                .textFieldStyle(PlainTextFieldStyle())
                                .overlay(RoundedRectangle(cornerRadius: 100.0).stroke(Color.white))
                                .foregroundColor(Color.white)
                                .background(Color(red: 0.333, green: 0.780, blue: 0.509))
                                .cornerRadius(100.0)
                                .padding(.leading, 10.0)
                            
                            Spacer()
                            NavigationLink(destination: VeganRecipeView(username: username).navigationBarBackButtonHidden(true), label: {Text("vegan")})
                                .font(.custom("Futura-Bold", size: 16))
                                .frame(width:80.0)
                                .frame(height: 45)
                                .textFieldStyle(PlainTextFieldStyle())
                                .overlay(RoundedRectangle(cornerRadius: 100.0).stroke(Color(red: 0.333, green: 0.780, blue: 0.509), lineWidth: 4))
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .cornerRadius(100.0)
                            
                            
                            Spacer()
                            NavigationLink(destination: GlutenFreeView(username: username).navigationBarBackButtonHidden(true), label: {Text("gluten free")})
                                .font(.custom("Futura-Bold", size: 16))
                                .frame(width: 120.0)
                                .frame(height: 45)
                                .textFieldStyle(PlainTextFieldStyle())
                                .overlay(RoundedRectangle(cornerRadius: 100.0).stroke(Color(red: 0.333, green: 0.780, blue: 0.509), lineWidth: 4))
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .cornerRadius(100.0)
                            
                            Spacer()
                            NavigationLink(destination: VegetarianView(username: username).navigationBarBackButtonHidden(true), label: {Text("vegetarian")})
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
                        
                        
                        Section(title: "Popular Recipes", recipes: recipes.prefix(12).dropFirst(8))
                        
                        Section(title: "Latest Recipes", recipes: recipes.prefix(4))
                        
                        Section(title: "Quick & Easy Recipes", recipes: recipes.prefix(8).dropFirst(4))
                                              
                        Section(title: "Healthy Recipes", recipes: recipes.prefix(16).dropFirst(12))
                        
                    }
                    .padding(.horizontal)
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
                            NavigationLink(destination: HomeView(username: username).navigationBarBackButtonHidden(true), label: {
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
                            NavigationLink(destination: SavedRecipesView(username: username).navigationBarBackButtonHidden(true), label: {
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

struct Section: View {
    var title: String
    var recipes: ArraySlice<Recipe>
    
    var body: some View {
        
        VStack{
            Text(title)
                .multilineTextAlignment(.leading)
                .font(.custom("Futura-Bold", size: 20))
                .foregroundColor(Color(red: 0.333, green: 0.780, blue: 0.509))
                .padding([.top, .leading], 10.0)
                
        }
        
        ScrollView(.horizontal){
            HStack( spacing: 10) {
                ForEach(recipes, id: \.id) { recipe in
                    NavigationLink(destination: RecipeDetail(recipe: recipe)) {
                        RecipeRow(recipe: recipe)
                            .foregroundColor(.black)
                            .padding(.leading, 10.0)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView(username: "")
}
