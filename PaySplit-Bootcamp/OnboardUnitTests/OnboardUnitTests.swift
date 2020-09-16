//
//  OnboardUnitTests.swift
//  OnboardUnitTests
//
//  Created by timofey makhlay on 9/15/20.
//  Copyright © 2020 PaySplit Inc. All rights reserved.
//

import XCTest

@testable import PaySplit_Bootcamp

class OnboardUnitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: Add one more test
    
    // Check that there are only 3 slides on the onboarding
    func testOnboardingNumberOfCells() {
        /// View model property
        let viewModel: OnboardViewModel = {
            return OnboardViewModel()
        }()
        
        viewModel.createPages()
        
        XCTAssertEqual(viewModel.numberOfCells, 3)
    }
    
    // test that the model converts properly into cellViewModel
    func testOnboardingMVVM() {
            let onboardItem = Onboard(centerImgName: "venmoText", description: "description", isGif: false)
            
            /// View model property
            let viewModel: OnboardViewModel = {
                return OnboardViewModel()
            }()
            
            let onboardingCellViewModel = viewModel.createCellViewModel(item: onboardItem)
            
        XCTAssertEqual(onboardingCellViewModel.descriptionText, "description") // text is moved properly onto the viewModel
        XCTAssertNotNil(onboardingCellViewModel.centerImgage)
    }
    
    // test that gifs don't become nil
    func testOnboardingGif() {
            let onboardItem = Onboard(centerImgName: "manualGiphy", description: "description", isGif: true)
            
            /// View model property
            let viewModel: OnboardViewModel = {
                return OnboardViewModel()
            }()
            
            let onboardingCellViewModel = viewModel.createCellViewModel(item: onboardItem)
            
        XCTAssertEqual(onboardingCellViewModel.descriptionText, "description") // text is moved properly onto the viewModel
        XCTAssertNotNil(onboardingCellViewModel.centerImgage)
    }

}
