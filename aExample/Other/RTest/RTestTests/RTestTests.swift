//
//  RTestTests.swift
//  RTestTests
//
//  Created by 林小鹏 on 2023/7/1.
//

import XCTest
@testable import RTest

final class RTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testLineViewModel() throws {
        
//        self.measureMetrics(<#T##metrics: [XCTPerformanceMetric]##[XCTPerformanceMetric]#>, automaticallyStartMeasuring: fal, for: <#T##() -> Void#>)
//        [self measureMetrics:[self class].defaultPerformanceMetrics automaticallyStartMeasuring:NO forBlock:^{
//
//            // Do setup work that needs to be done for every iteration but you don't want to measure before the call to -startMeasuring
//            SetupSomething();
//            [self startMeasuring];
//
//            // Do that thing you want to measure.
//            MyFunction();
//            [self stopMeasuring];
//
//            // Do teardown work that needs to be done for every iteration but you don't want to measure after the call to -stopMeasuring
//            TeardownSomething();
//        }];
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
