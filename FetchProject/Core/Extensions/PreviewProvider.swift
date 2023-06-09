//
//  PreviewProvider.swift
//  FetchProject
//
//  Created by Xinzhuo Liu on 6/8/23.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}
    
    let homeVM = HomeViewModel()
    
    let meal = Meal(id: "52931", strMeal: "Sugar Pie", strMealThumb: "https://www.themealdb.com/images/media/meals/yrstur1511816601.jpg")
    
    let menu = [Meal(id: "52931", strMeal: "Sugar Pie", strMealThumb: "https://www.themealdb.com/images/media/meals/yrstur1511816601.jpg"),
                Meal(id: "53049", strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
                Meal(id: "52893", strMeal: "Apple Frangipan Tart", strMealThumb: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg")]
}
