//
//  HomeViewModel_Tests.swift
//  FetchProject_Tests
//
//  Created by Xinzhuo Liu on 6/10/23.
//

@testable import FetchProject
import XCTest
import Combine

final class HomeViewModel_Tests: XCTestCase {
    
    var sut: HomeViewModel!
    var mealService: MealService!
    var meals: [Meal]!

    override func setUpWithError() throws {
        sut = HomeViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_HomeViewModel_sortMeals_MealsSortedAlphabeticallyAfterDelay() throws {
        
        print(sut.menu.meals.count)
        XCTAssertTrue(sut.menu.meals.count > 0)
    }
}
