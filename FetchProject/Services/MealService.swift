//
//  MealService.swift
//  FetchProject
//
//  Created by Xinzhuo Liu on 6/6/23.
//

import Foundation
import Combine

//protocol MealServiceProtocol {
//  var menu: Menu { get set }
//  func getMeal()
//}

class MealService {
    
    @Published var menu: Menu = Menu(meals: [])
    
    var mealSubscription: AnyCancellable?
    
    init() {
        getMeal()
    }
    
    func getMeal() {
        guard let url = URL(string:"https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }
                
        mealSubscription = NetworkingManager.download(url: url)
            .decode(type: Menu.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self]
                (returnedMenu) in
                self?.menu = returnedMenu
                self?.mealSubscription?.cancel()
            })
    }
    
    func setMenu(menu: Menu) {
            self.menu = menu
        }
}

class MockMealService: MealService {
    override func getMeal() {
        // We intentionally leave this blank for the mock service
    }
}

