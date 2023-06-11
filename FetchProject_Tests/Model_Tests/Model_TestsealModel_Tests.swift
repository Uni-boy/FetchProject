//
//  Model_Tests.swift
//  FetchProject_Tests
//
//  Created by Xinzhuo Liu on 6/11/23.
//

import XCTest
@testable import FetchProject

final class Model_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_MenuModel_CompatibleToJsonData_True() throws {
        let jsonData = """
{
"meals": [
{
"strMeal": "Apam balik",
"strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
"idMeal": "53049"
}
]
}
""".data(using: .utf8)!
        let decoder = JSONDecoder()
        let menu = try decoder.decode(Menu.self, from: jsonData)
        
        XCTAssertEqual(menu.meals[0].id, "53049")
        XCTAssertEqual(menu.meals[0].strMeal, "Apam balik")
        XCTAssertEqual(menu.meals[0].strMealThumb, "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
    }

    func test_MealDetail_CompatibleToJsonData() throws {
        let jsonData = """
        {
        "meals": [
        {
        "idMeal": "53049",
        "strMeal": "Apam balik",
        "strDrinkAlternate": null,
        "strCategory": "Dessert",
        "strArea": "Malaysian",
        "strInstructions": "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\\r\\n\\r\\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\\r\\n\\r\\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\\r\\n\\r\\nCut into wedges and best eaten when it is warm.",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
        "strTags": null,
        "strYoutube": "https://www.youtube.com/watch?v=6R8ffRRJcrg",
        "strIngredient1": "Milk",
        "strIngredient2": "Oil",
        "strIngredient3": "Eggs",
        "strIngredient4": "Flour",
        "strIngredient5": "Baking Powder",
        "strIngredient6": "Salt",
        "strIngredient7": "Unsalted Butter",
        "strIngredient8": "Sugar",
        "strIngredient9": "Peanut Butter",
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
        "strMeasure1": "200ml",
        "strMeasure2": "60ml",
        "strMeasure3": "2",
        "strMeasure4": "1600g",
        "strMeasure5": "3 tsp",
        "strMeasure6": "1/2 tsp",
        "strMeasure7": "25g",
        "strMeasure8": "45g",
        "strMeasure9": "3 tbs",
        "strMeasure10": " ",
        "strMeasure11": " ",
        "strMeasure12": " ",
        "strMeasure13": " ",
        "strMeasure14": " ",
        "strMeasure15": " ",
        "strMeasure16": " ",
        "strMeasure17": " ",
        "strMeasure18": " ",
        "strMeasure19": " ",
        "strMeasure20": " ",
        "strSource": "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
        "strImageSource": null,
        "strCreativeCommonsConfirmed": null,
        "dateModified": null
}
]
}
""".data(using: .utf8)!
        let decoder = JSONDecoder()
        let mealResponse = try decoder.decode(MealResponse.self, from: jsonData)
        let mealDetail = mealResponse.meals.first
        
        XCTAssertEqual(mealDetail?.idMeal, "53049")
        XCTAssertEqual(mealDetail?.strMeal, "Apam balik")
        XCTAssertEqual(mealDetail?.strCategory, "Dessert")
        XCTAssertEqual(mealDetail?.strMealThumb, "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
        XCTAssertEqual(mealDetail?.strInstructions, "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.")
    }

    func test_MealDetail_ingredients_notNull() throws {
        let jsonData = """
        {
        "meals": [
        {
        "idMeal": "53049",
        "strMeal": "Apam balik",
        "strDrinkAlternate": null,
        "strCategory": "Dessert",
        "strArea": "Malaysian",
        "strInstructions": "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\\r\\n\\r\\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\\r\\n\\r\\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\\r\\n\\r\\nCut into wedges and best eaten when it is warm.",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
        "strTags": null,
        "strYoutube": "https://www.youtube.com/watch?v=6R8ffRRJcrg",
        "strIngredient1": "Milk",
        "strIngredient2": "Oil",
        "strIngredient3": "Eggs",
        "strIngredient4": "Flour",
        "strIngredient5": "Baking Powder",
        "strIngredient6": "Salt",
        "strIngredient7": "Unsalted Butter",
        "strIngredient8": "Sugar",
        "strIngredient9": "Peanut Butter",
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
        "strMeasure1": "200ml",
        "strMeasure2": "60ml",
        "strMeasure3": "2",
        "strMeasure4": "1600g",
        "strMeasure5": "3 tsp",
        "strMeasure6": "1/2 tsp",
        "strMeasure7": "25g",
        "strMeasure8": "45g",
        "strMeasure9": "3 tbs",
        "strMeasure10": " ",
        "strMeasure11": " ",
        "strMeasure12": " ",
        "strMeasure13": " ",
        "strMeasure14": " ",
        "strMeasure15": " ",
        "strMeasure16": " ",
        "strMeasure17": " ",
        "strMeasure18": " ",
        "strMeasure19": " ",
        "strMeasure20": " ",
        "strSource": "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
        "strImageSource": null,
        "strCreativeCommonsConfirmed": null,
        "dateModified": null
}
]
}
""".data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let mealResponse = try decoder.decode(MealResponse.self, from: jsonData)
        let mealDetail = mealResponse.meals.first
        
        let ingredients = mealDetail?.ingredients
        XCTAssertEqual(ingredients?.count, 9)
        XCTAssertEqual(ingredients?.first?.0, "Milk")
        XCTAssertEqual(ingredients?.first?.1, "200ml")
    }
}
