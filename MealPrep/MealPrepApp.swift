//
//  MealPrepApp.swift
//  MealPrep
//
//  Created by Giulietta Lee on 24/4/2024.
//

import SwiftUI

@main
struct MealPrepApp: App {
    @StateObject var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            SignUpView()
                .environmentObject(ModelData())
        }
    }
}
