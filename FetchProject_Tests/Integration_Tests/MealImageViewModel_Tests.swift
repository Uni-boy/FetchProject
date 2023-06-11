//
//  MealImageViewModel_Tests.swift
//  FetchProject_Tests
//
//  Created by Xinzhuo Liu on 6/11/23.
//

import XCTest
@testable import FetchProject

final class MealImageViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Given
        let expectation = XCTestExpectation(description: "MealImageViewModel should fetch an image")
        let meal = Meal(id: "52931", strMeal: "Sugar Pie", strMealThumb: "https://www.themealdb.com/images/media/meals/yrstur1511816601.jpg")
        let viewModel = MealImageViewModel(meal: meal)
        
        // When
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 10.0)

        XCTAssertNotNil(viewModel.image, "image should not be nil after image fetch")
    }

}
