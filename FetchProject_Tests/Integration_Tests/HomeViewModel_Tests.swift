//
//  HomeViewModel_Tests.swift
//  FetchProject_Tests
//
//  Created by Xinzhuo Liu on 6/11/23.
//

import XCTest
@testable import FetchProject

final class HomeViewModel_Tests: XCTestCase {
    
    var viewModel: HomeViewModel!

    override func setUpWithError() throws {
        super.setUp()
        viewModel = HomeViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        super.tearDown()
    }

    func test_HomeViewModel_reloadData_menuNotEmpty() throws {
        viewModel.reloadData()
        viewModel.searchText = ""
        
        let expectation = XCTestExpectation(description: "Wait for publisher")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
        XCTAssertFalse(viewModel.menu.meals.isEmpty)
    }

    func test_HomeViewModel_searchTest_resultsContainSearchText() throws {
        viewModel.searchText = "ap"
        
        let expectation = XCTestExpectation(description: "Wait for publisher")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
        
        for meal in viewModel.menu.meals {
            XCTAssertTrue(meal.strMeal.lowercased().contains("ap"))
        }
    }

}
