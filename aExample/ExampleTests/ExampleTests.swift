//
//  ExampleTests.swift
//  ExampleTests
//
//  Created by 林小鹏 on 2023/5/17.
//

@testable import Example
import XCTest

final class ExampleTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testOldTargetExample() throws {
        let liked1 = LikedCommand()
        let liked2 = LikedCommand()

        CommandManager.share.executeCommand(cmd: liked1) { cmd in
            print("点赞命令完成回调 cmd1 === ", cmd)
        }

        CommandManager.share.executeCommand(cmd: liked2) { cmd in
            print("点赞命令完成回调 cmd1 === ", cmd)
        }

        CommandManager.share.executeCommand(cmd: liked1, completion: nil)
    }

    
    func testCommandExample() throws {
        let liked1 = LikedCommand()
        let liked2 = LikedCommand()

        CommandManager.share.executeCommand(cmd: liked1) { cmd in
            print("点赞命令完成回调 cmd1 === ", cmd)
        }

        CommandManager.share.executeCommand(cmd: liked2) { cmd in
            print("点赞命令完成回调 cmd1 === ", cmd)
        }

        CommandManager.share.executeCommand(cmd: liked1, completion: nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
