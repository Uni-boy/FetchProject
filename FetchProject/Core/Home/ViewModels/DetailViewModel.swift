//
//  DetailViewModel.swift
//  FetchProject
//
//  Created by Xinzhuo Liu on 6/9/23.
//

import Foundation
import SwiftUI
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var mealDetail: MealDetail?
    @Published var image: UIImage?
    
    private var detailService: DetailService
    private var mealService: MealImageService
    private var detailSubscription: AnyCancellable?
    
    init(meal: Meal) {
        self.mealService = MealImageService(meal: meal)
        self.detailService = DetailService(meal: meal)
        self.image = mealService.image
        addSubscribers()
    }
    
    private func addSubscribers() {
        detailSubscription = detailService.$mr
            .compactMap { $0?.meals.first }  // Use compactMap to ignore nil
            .sink(receiveValue: { [weak self] meal in
                self?.mealDetail = meal
            })
    }
    
    deinit {
        detailSubscription?.cancel()
    }

}
