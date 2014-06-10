//
//  ExampleTests.swift
//  Quick
//
//  Created by Jacob Gable on 6/10/14.
//  Copyright (c) 2014 Brian Ivan Gesiak. All rights reserved.
//

import XCTest
import Quick

class ExampleTests : XCTestCase {
    func testExamples() {
        var root = ExampleGroup("Person")
        var beforeRan = false
        var isHappyRan = false
        var afterRan = false

        var person: Person?
        root.appendBefore {
            person = Person()
            beforeRan = true
        }

        root.appendAfter {
            afterRan = true
        }

        var itIsHappy = Example("is happy") {
            XCTAssert(person!.isHappy, "expected person to be happy by default")
            isHappyRan = true
        }
        root.appendExample(itIsHappy)

        XCTAssertEqualObjects(itIsHappy.name, "Person, is happy", "expected name to be 'Person, is happy'")

        XCTAssert(!beforeRan, "expected beforeRan to not have run yet")
        XCTAssert(!afterRan, "expected after to not have run yet")
        XCTAssert(!isHappyRan, "expected itIsHappy to not have run yet")

        root.run()
        
        XCTAssert(beforeRan, "expected beforeRan to have ran")
        XCTAssert(afterRan, "expected after to have ran")
        XCTAssert(isHappyRan, "expected itIsHappy to have ran")
    }
}
