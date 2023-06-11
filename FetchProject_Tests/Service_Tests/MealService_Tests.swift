//
//  MealService_Tests.swift
//  FetchProject_Tests
//
//  Created by Xinzhuo Liu on 6/10/23.
//

import XCTest
@testable import FetchProject

final class MealService_Tests: XCTestCase {
    
    var sut: MealService!

    override func setUpWithError() throws {
        sut = MealService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_MealService_getMeal_MealsDownloadedAfterDelay() throws {
        let expectation = XCTestExpectation(description: "Meals downloaded.")
        
        sut.getMeal()
        
        // Wait for some time and then check if meals have been loaded
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            if !self.sut.menu.meals.isEmpty {
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
