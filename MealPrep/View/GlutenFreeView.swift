//
//  GlutenFreeView.swift
//  MealPrep
//
//  Created by Giulietta Lee on 3/5/2024.
//

import SwiftUI

struct GlutenFreeView: View {
    
    var username: String
    var body: some View {
        NavigationView {
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
                            .overlay(RoundedRectangle(cornerRadius: 100.0).stroke(Color(red: 0.333, green: 0.780, blue: 0.509), lineWidth: 4))
                            .foregroundColor(Color.black)
                            .background(Color.white)
                            .cornerRadius(100.0)
                            .padding(.leading, 5.0)
                        
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
                            .overlay(RoundedRectangle(cornerRadius: 100.0).stroke(Color.white))
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.333, green: 0.780, blue: 0.509))
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
                   
                    Spacer()
                    FilteredSection(recipes: recipes.prefix(2))
                        
                    
                    FilteredSection(recipes: recipes.prefix(4).dropFirst(2))
                    
                    FilteredSection(recipes: recipes.prefix(6).dropFirst(4))
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}


#Preview {
    GlutenFreeView(username: "")
}
