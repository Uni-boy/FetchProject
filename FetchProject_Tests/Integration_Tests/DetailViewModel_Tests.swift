//
//  DetailViewModel_Tests.swift
//  FetchProject_Tests
//
//  Created by Xinzhuo Liu on 6/11/23.
//

import XCTest
@testable import FetchProject

final class DetailViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let meal = Meal(id: "52931", strMeal: "Sugar Pie", strMealThumb: "https://www.themealdb.com/images/media/meals/yrstur1511816601.jpg")
        
        let viewModel = DetailViewModel(meal: meal)
        let expectation = XCTestExpectation(description: "DetailService is getting detail")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
        
        XCTAssertNotNil(viewModel.mealDetail)
        XCTAssertNotNil(viewModel.image)
        
    }

}
