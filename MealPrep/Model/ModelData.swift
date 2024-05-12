//
//  ModelData.swift
//  MealPrep
//
//  Created by Giulietta Lee on 24/4/2024.
//

import Foundation

class ModelData: ObservableObject {
    @Published var recipes: [RecipeModel.Recipe] = []

    init() {
        self.recipes = load("recipeData.json")
    }

    func saveChanges() {
        save(recipes, to: "recipeData.json")
    }
    
    func toggleFavorite(recipe: RecipeModel.Recipe){
        if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
            recipes[index].isFavorite.toggle()
            saveChanges()
        }
    }

    private func load<T: Decodable>(_ filename: String) -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }

    private func save<T: Encodable>(_ data: T, to filename: String) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            let jsonData = try encoder.encode(data)
            try jsonData.write(to: url, options: .atomicWrite)
        } catch {
            fatalError("Error saving data to \(filename):\n\(error)")
        }
    }
}


