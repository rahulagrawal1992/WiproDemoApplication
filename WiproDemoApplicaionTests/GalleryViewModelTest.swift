//
//  GalleryViewModelTest.swift
//  WiproDemoApplicaionTests
//
//  Created by Rahul Agrawal on 16/07/19.
//  Copyright © 2019 Rahul Agrawal. All rights reserved.
//

import XCTest
@testable import WiproDemoApplicaion

class GalleryViewModelTest: XCTestCase {

    var viewModel : GalleryViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        //initialize GalleryViewModel
        viewModel = GalleryViewModel(dataUpdatedAction:{})
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        super.tearDown()
    }
    
    func getTitle(){
        if let title = viewModel.getTitle(), title.count > 0 {
            XCTAssert(true)
        }else{
            XCTFail("Title should be there in Api response")
        }
    }
    // Test Api Response
    func testGetDataFromApi() {
        let e = expectation(description: "Get response in 5 second")
        
        viewModel.getDataFromApi {[weak self] in
            XCTAssertNotNil(self?.viewModel.data, "Expected non-nil data")
            e.fulfill()
            self?.getTitle()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
