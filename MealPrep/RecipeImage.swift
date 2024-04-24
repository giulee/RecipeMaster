//
//  RecipeImage.swift
//  MealPrep
//
//  Created by Giulietta Lee on 24/4/2024.
//

import SwiftUI

struct RecipeImage: View {
    var image: Image

    var body: some View {
        image
            //.clipShape(Rectangle())
            //  .overlay {
              // Rectangle().stroke(.white, lineWidth: 4)
          //  }
            .shadow(radius: 7)
            .cornerRadius(15)
    }
}

#Preview {
    RecipeImage(image: Image("pasta"))
}
