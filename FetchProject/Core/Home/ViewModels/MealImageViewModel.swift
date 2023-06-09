//
//  MealImageViewModel.swift
//  FetchProject
//
//  Created by Xinzhuo Liu on 6/9/23.
//

import Foundation
import SwiftUI
import Combine

class MealImageViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading: Bool = false
    
    let meal: Meal
    private let dataService: MealImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(meal: Meal) {
        self.meal = meal
        self.dataService = MealImageService(meal: meal)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

    }
}
