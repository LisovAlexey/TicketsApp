//
//  TestDecodingEventPreview.swift
//  BuyTicketsChallengeAppTests
//
//  Created by Alexey Lisov on 09/05/2023.
//

import XCTest
@testable import BuyTicketsChallengeApp

class DecodingModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testDecodingEventPreview() {
        guard let path = Bundle.main.path(forResource: "EventPreviewMock", ofType: "json") else {
            fatalError("No file")
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            fatalError("No file")
        }

        
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .iso8601
        
        guard let eventPreview: EventPreview = try? decoder.decode(EventPreview.self, from: data) else {
            fatalError("Can't decode")
        }
        
        XCTAssertEqual(eventPreview.price, 50.0)
        
        
    }
}
