//
//  HomeViewModel.swift
//  FetchProject
//
//  Created by Xinzhuo Liu on 6/8/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var menu: Menu = Menu(meals: [])
    @Published var searchText: String = ""
    
    private var mealService = MealService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    // combine the search text to generate updated results of meals
    // store the reference to the subscriber in case of `Publisher` stop emitting events
    func addSubscribers() {
        $searchText
            .combineLatest(mealService.$menu)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterAndSortMeals)
            .sink { [weak self] (returnedMenu) in
                self?.menu = returnedMenu
            }
            .store(in: &cancellables)
    }
    
    func setMealService(mealService: MealService) {
        self.mealService = mealService
    }
    
    func reloadData() {
        mealService.getMeal()
    }
    
    private func filterAndSortMeals(text: String, menu: Menu) -> Menu {
        var updatedMeals = filterMeals(text: text, meals: menu.meals)
        sortMeals(meals: &updatedMeals)
        return Menu(meals: updatedMeals)
    }
    
    // filter according to the search bar text
    private func filterMeals(text: String, meals: [Meal]) -> [Meal] {
        guard !text.isEmpty else {
            return meals
        }
        
        let lowercasedText = text.lowercased()
        
        return meals.filter({ (meal) -> Bool in
            return meal.strMeal.lowercased().contains(lowercasedText)
        })
    }
    
    // sort function
    private func sortMeals(meals: inout [Meal]) {
        meals.sort()
    }
}
