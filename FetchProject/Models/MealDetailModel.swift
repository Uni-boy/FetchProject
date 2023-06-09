//
//  DetailModel.swift
//  FetchProject
//
//  Created by Xinzhuo Liu on 6/6/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let detail = try? JSONDecoder().decode(Detail.self, from: jsonData)

import Foundation
/*
 {
 "meals": [
 {
 "idMeal": "52893",
 "strMeal": "Apple & Blackberry Crumble",
 "strDrinkAlternate": null,
 "strCategory": "Dessert",
 "strArea": "British",
 "strInstructions": "Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\r\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\r\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.",
 "strMealThumb": "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
 "strTags": "Pudding",
 "strYoutube": "https://www.youtube.com/watch?v=4vhcOwVBDO4",
 "strIngredient1": "Plain Flour",
 "strIngredient2": "Caster Sugar",
 "strIngredient3": "Butter",
 "strIngredient4": "Braeburn Apples",
 "strIngredient5": "Butter",
 "strIngredient6": "Demerara Sugar",
 "strIngredient7": "Blackberrys",
 "strIngredient8": "Cinnamon",
 "strIngredient9": "Ice Cream",
 "strIngredient10": "",
 "strIngredient11": "",
 "strIngredient12": "",
 "strIngredient13": "",
 "strIngredient14": "",
 "strIngredient15": "",
 "strIngredient16": "",
 "strIngredient17": "",
 "strIngredient18": "",
 "strIngredient19": "",
 "strIngredient20": "",
 "strMeasure1": "120g",
 "strMeasure2": "60g",
 "strMeasure3": "60g",
 "strMeasure4": "300g",
 "strMeasure5": "30g",
 "strMeasure6": "30g",
 "strMeasure7": "120g",
 "strMeasure8": "¼ teaspoon",
 "strMeasure9": "to serve",
 "strMeasure10": "",
 "strMeasure11": "",
 "strMeasure12": "",
 "strMeasure13": "",
 "strMeasure14": "",
 "strMeasure15": "",
 "strMeasure16": "",
 "strMeasure17": "",
 "strMeasure18": "",
 "strMeasure19": "",
 "strMeasure20": "",
 "strSource": "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
 "strImageSource": null,
 "strCreativeCommonsConfirmed": null,
 "dateModified": null
 }
 ]
 }
 */

import Foundation

// The struct that represents a single meal
struct MealDetail: Codable {
    let idMeal, strMeal, strCategory: String
    let strDrinkAlternate: String?
    let strArea, strInstructions, strMealThumb, strTags: String?
    let strYoutube: String?
    let strIngredient1, strIngredient2, strIngredient3, strIngredient4: String?
    let strIngredient5, strIngredient6, strIngredient7, strIngredient8: String?
    let strIngredient9, strIngredient10, strIngredient11, strIngredient12: String?
    let strIngredient13, strIngredient14, strIngredient15, strIngredient16: String?
    let strIngredient17, strIngredient18, strIngredient19, strIngredient20: String?
    let strMeasure1, strMeasure2, strMeasure3, strMeasure4: String?
    let strMeasure5, strMeasure6, strMeasure7, strMeasure8: String?
    let strMeasure9, strMeasure10, strMeasure11, strMeasure12: String?
    let strMeasure13, strMeasure14, strMeasure15, strMeasure16: String?
    let strMeasure17, strMeasure18, strMeasure19, strMeasure20: String?
    let strSource, strImageSource, strCreativeCommonsConfirmed, dateModified: String?

    enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strDrinkAlternate, strCategory
        case strArea, strInstructions, strMealThumb, strTags
        case strYoutube
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4
        case strIngredient5, strIngredient6, strIngredient7, strIngredient8
        case strIngredient9, strIngredient10, strIngredient11, strIngredient12
        case strIngredient13, strIngredient14, strIngredient15, strIngredient16
        case strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4
        case strMeasure5, strMeasure6, strMeasure7, strMeasure8
        case strMeasure9, strMeasure10, strMeasure11, strMeasure12
        case strMeasure13, strMeasure14, strMeasure15, strMeasure16
        case strMeasure17, strMeasure18, strMeasure19, strMeasure20
        case strSource, strImageSource, strCreativeCommonsConfirmed, dateModified
    }
    
    var ingredients: [(String, String)] {
            var result: [(String, String)] = []
            
            let mirror = Mirror(reflecting: self)
            
            for index in 1...20 {
                let ingredientKey = "strIngredient\(index)"
                let measureKey = "strMeasure\(index)"
                
                if let ingredientValue = mirror.descendant(ingredientKey) as? String,
                   let measureValue = mirror.descendant(measureKey) as? String,
                   !ingredientValue.isEmpty, !measureValue.isEmpty {
                    result.append((ingredientValue, measureValue))
                }
            }
            
            return result
        }
}
