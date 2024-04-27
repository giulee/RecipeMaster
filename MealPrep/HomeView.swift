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
        NavigationSplitView {
        
        //need to figure out how to left align text
        //figure out how to add a navigation bar at the bottom of the screen
       
        Text("Explore")
            .multilineTextAlignment(.leading)
            .font(.custom("Futura-Bold", size: 40))
            .padding(.bottom)
        
        Text("Popular Recipes")
            .multilineTextAlignment(.leading)
            .font(.custom("Futura-Bold", size: 20))
            .foregroundColor(Color(red: 0.333, green: 0.780, blue: 0.509))
            
           
           
        List(recipes) { recipe in
            NavigationLink {
               RecipeDetail(recipe: recipe).navigationBarBackButtonHidden(true)
            } label: {
                RecipeRow(recipe: recipe)
            }
        }
        
    } detail: {
        Text("Select a Recipe")
    }
}
}

#Preview {
    HomeView(username: "")
}
