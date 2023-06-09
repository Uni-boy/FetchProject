//
//  MealModel.swift
//  FetchProject
//
//  Created by Xinzhuo Liu on 6/6/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let meal = try? JSONDecoder().decode(Meal.self, from: jsonData)

import Foundation

struct Menu: Codable {
    let meals: [Meal]
}

struct Meal: Identifiable, Codable, Comparable {
    static func < (lhs: Meal, rhs: Meal) -> Bool {
        lhs.strMeal.lowercased() < rhs.strMeal.lowercased()
    }
    
    let id: String
    let strMeal: String
    let strMealThumb: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal, strMealThumb
    }
}
