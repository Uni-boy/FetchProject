//
//  MealImageService.swift
//  FetchProject
//
//  Created by Xinzhuo Liu on 6/9/23.
//

import Foundation
import SwiftUI
import Combine

class MealImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let meal: Meal
    private let fileManager = LocalFileManager.instance
    private let folderName = "meal_images"
    private let imageName: String
    
    init(meal: Meal) {
        self.meal = meal
        self.imageName = meal.id
        getMealImage()
    }
    
    private func getMealImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
        } else {
            downloadMealImage()
        }
    }
    
    private func downloadMealImage() {
        guard let url = URL(string: meal.strMealThumb) else {
            return
        }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadImage = returnedImage else { return }
                self.image = downloadImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
