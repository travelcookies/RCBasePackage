//
//  ExampleTests.swift
//  ExampleTests
//
//  Created by 林小鹏 on 2023/5/17.
//

import XCTest
@testable import Example

final class ExampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        

        let liked1 = LikedCommand()
        let liked2 = LikedCommand()
        
        CommandManager.share.executeCommand(cmd: liked1) { cmd in
            print("点赞命令完成回调 cmd1 === ", cmd)
        }
        
        CommandManager.share.executeCommand(cmd: liked2) { cmd in
            print("点赞命令完成回调 cmd1 === ", cmd)
        }

//            [CommandManager executeCommand:liked completion:^(Command *cmd) {
//                NSLog(@"点赞命令完成回调 cmd === %@", cmd);
//            }];
//
//            [CommandManager executeCommand:share completion:^(Command *cmd) {
//                NSLog(@"分享命令完成回调 cmd === %@", cmd);
//            }]
        
        
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
