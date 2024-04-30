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
            ScrollView {
                VStack(spacing: 20) {
                    Text("Explore")
                        .font(.custom("Futura-Bold", size: 40))
                        .padding(.bottom)
                    
                    Section(title: "Popular Recipes", recipes: recipes.prefix(4))
                    
                    Section(title: "Latest Recipes", recipes: recipes.prefix(8).dropFirst(4))
                    
                    Section(title: "Quick & Easy Recipes", recipes: recipes.prefix(12).dropFirst(8))
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct Section: View {
    var title: String
    var recipes: ArraySlice<Recipe>
    
    var body: some View {
        
        VStack{
            Text(title)
                .font(.custom("Futura-Bold", size: 20))
                .foregroundColor(Color(red: 0.333, green: 0.780, blue: 0.509))
                .padding(.top)
        }
        
        ScrollView(.horizontal){
            HStack( spacing: 10) {
                ForEach(recipes, id: \.id) { recipe in
                    NavigationLink(destination: RecipeDetail(recipe: recipe)) {
                        RecipeRow(recipe: recipe)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView(username: "")
}
