//
//  DetailService_Tests.swift
//  FetchProject_Tests
//
//  Created by Xinzhuo Liu on 6/10/23.
//

import XCTest
@testable import FetchProject

final class DetailService_Tests: XCTestCase {

    var sut: DetailService!
    var meal: Meal!

    override func setUpWithError() throws {
        meal = Meal(id: "52931", strMeal: "Sugar Pie", strMealThumb: "https://www.themealdb.com/images/media/meals/yrstur1511816601.jpg")
        sut = DetailService(meal: meal)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_DetailService_getDetail_MealDetailDownloadedAfterDelay() throws {
        let expectation = XCTestExpectation(description: "MealDetail downloaded.")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            if self.sut.mr != nil {
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
