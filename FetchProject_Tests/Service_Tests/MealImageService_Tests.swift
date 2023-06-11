//
//  MealImageService_Tests.swift
//  FetchProject_Tests
//
//  Created by Xinzhuo Liu on 6/10/23.
//

import XCTest
@testable import FetchProject

final class MealImageService_Tests: XCTestCase {
    
    var sut: MealImageService!
    var meal: Meal!

    override func setUpWithError() throws {
        meal = Meal(id: "1", strMeal: "Chicken Wings", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
        sut = MealImageService(meal: meal)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_MealImageService_getMealImage_ImageDownloadedOrExistedAfterDelay() throws {
        let expectation = XCTestExpectation(description: "MealImage downloaded.")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            if self.sut.image != nil {
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
