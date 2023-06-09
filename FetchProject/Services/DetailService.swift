//
//  DetailService.swift
//  FetchProject
//
//  Created by Xinzhuo Liu on 6/9/23.
//

import Foundation
import Combine

class DetailService {
    
    @Published var mr: MealResponse?
    
    var detailSubscription: AnyCancellable?
    
    init(meal: Meal) {
        getDetail(meal: meal)
    }
    
    func getDetail(meal: Meal) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(meal.id)") else {
            return
        }
        print(url)
        detailSubscription = NetworkingManager.download(url: url)
            .decode(type: MealResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (response) in
                self?.mr = response
                print("\(self?.mr)")
                self?.detailSubscription?.cancel()
            })
    }
}
