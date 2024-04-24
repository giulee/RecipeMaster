//
//  HomeView.swift
//  MealPrep
//
//  Created by Giulietta Lee on 24/4/2024.
//

import SwiftUI

struct HomeView: View {
    var username: String
    
    
    var body: some View {  NavigationSplitView {
        
        Text("Explore")
            .multilineTextAlignment(.leading)
            .font(.custom("Futura-Bold", size: 40))
           
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
