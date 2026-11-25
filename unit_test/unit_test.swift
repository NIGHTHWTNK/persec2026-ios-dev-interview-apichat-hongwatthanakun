//
//  unit_test.swift
//  unit_test
//
//  Created by night on 25/11/2569 BE.
//

import XCTest

final class unit_test: XCTestCase {

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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // unit tests
    // reference: https://dev.to/sokol8/how-to-unit-test-cli-application-in-swift-5f5o
    
    func testQuestion1() throws {
        XCTAssertTrue(question1("()"))
        XCTAssertFalse(question1("([]]"))
        XCTAssertTrue(question1("([{}])"))
        XCTAssertFalse(question1("([[{}]]]"))
        XCTAssertFalse(question1(")"))
        XCTAssertFalse(question1("(]}])"))
        XCTAssertFalse(question1("([)]"))
        XCTAssertFalse(question1("{"))
    }
    
    func testQuestion2() throws {
        let input1 = question2(["TH19", "SG20", "TH2"])
        let result1 = ["SG20", "TH2", "TH19"]
        
        XCTAssertEqual(input1, result1)
        
        let input2 = question2(["TH10", "TH3Netflix", "TH1", "TH7"])
        let result2 = ["TH1", "TH3Netflix", "TH7", "TH10"]
        
        XCTAssertEqual(input2, result2)
    }
    
    func testQuestion3() throws {
        let input1 = question3(search: "th"
                               , items: ["Mother", "Think", "Worthy", "Apple", "Android"]
                               , maxResult: 2)
        let result1 = ["Think", "Mother"]
        
        XCTAssertEqual(input1, result1)
        
        let input2 = question3(search: "ap"
                                , items: ["Mother", "Think", "Worthy", "Apple", "Android"]
                                , maxResult: 5)
        let result2 = ["Apple"]
        
        XCTAssertEqual(input2, result2)
    }
    
    func testQuestion4() throws {
        // number to roman text
        let input1 = question4IntToRoman(1989)
        let result1 = "MCMLXXXIX"
        
        XCTAssertEqual(input1, result1)
        
        let input2 = question4IntToRoman(2000)
        let result2 = "MM"
        
        XCTAssertEqual(input2, result2)
        
        let input3 = question4IntToRoman(68)
        let result3 = "LXVIII"
        
        XCTAssertEqual(input3, result3)
        
        let input4 = question4IntToRoman(109)
        let result4 = "CIX"
        
        XCTAssertEqual(input4, result4)
        
        // roman text to number
        let input5 = question4RomanToInt("MCMLXXXIX")
        let result5 = 1989
        
        XCTAssertEqual(input5, result5)
        
        let input6 = question4RomanToInt("MM")
        let result6 = 2000
        
        XCTAssertEqual(input6, result6)
        
        let input7 = question4RomanToInt("LXVIII")
        let result7 = 68
        
        XCTAssertEqual(input7, result7)
        
        let input8 = question4RomanToInt("CIX")
        let result8 = 109
        
        XCTAssertEqual(input8, result8)
    }
    
    func testQuestion5() throws {
        XCTAssertEqual(question5(3008), 8300)
        XCTAssertEqual(question5(1989), 9981)
        XCTAssertEqual(question5(2679), 9762)
        XCTAssertEqual(question5(9163), 9631)
    }
    
    func testQuestion6() throws {
        let input1 = question6(items: [1, 3, 5], amount: 5)
        let result1 = [1, 3, 5, 9, 17]
        
        XCTAssertEqual(input1, result1)
        
        let input2 = question6(items: [2, 2, 2], amount: 3)
        let result2 = [2, 2, 2]
        
        XCTAssertEqual(input2, result2)
        
        let input3 = question6(items: [10, 10, 10], amount: 4)
        let result3 = [10, 10, 10, 30]
        
        XCTAssertEqual(input3, result3)
        
        let input4 = question6(items: [], amount: 2)
        let result4 = [0, 0]
        
        XCTAssertEqual(input4, result4)
        
        let input5 = question6(items: [1], amount: 10)
        let result5 = [1, 1, 2, 4, 7, 13, 24, 44, 81, 149]
        
        XCTAssertEqual(input5, result5)
    }
}
