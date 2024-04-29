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
        
        //figure out how to add a navigation bar at the bottom of the screen
        //figure out how to get rid of border
       
        Text("Explore")
            .multilineTextAlignment(.leading)
            .font(.custom("Futura-Bold", size: 40))
            .padding(.bottom)
        
       
            List(recipes.prefix(1)) { recipe in
            NavigationLink {
               RecipeDetail(recipe: recipe).navigationBarBackButtonHidden(true)
            } label: {
                RecipeRow(recipe: recipe)
            }
        }
            
    }
    detail: {
        Text("Select a Recipe")
    }
}
}

#Preview {
    HomeView(username: "")
}
