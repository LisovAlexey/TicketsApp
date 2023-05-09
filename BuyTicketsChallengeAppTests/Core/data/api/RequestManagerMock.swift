//
//  RequestManagerMock.swift
//  BuyTicketsChallengeAppTests
//
//  Created by Alexey Lisov on 09/05/2023.
//

import XCTest
@testable import BuyTicketsChallengeApp

class RequestManagerTests: XCTestCase {
    private var requestManager: RequestManagerProtocol?
    
    override func setUp() {
        super.setUp()
        requestManager = RequestManager(
            apiManager: APIManagerMock()
        )
    }
    
    func testRequestEvents() async throws {
        guard let events: [EventPreview] =
                try await requestManager?.perform(
                    EventsPreviewRequestMock.getEvents) else {
            XCTFail("Didn't get data from the request manager")
            return
        }
        
        
        let first = events.first
        let last = events.last
        XCTAssertEqual(first?.id, UUID(uuidString: "9F1A13B2-76F5-4205-A0D4-15A975B53262"))
        XCTAssertEqual(first?.title, "Music Concert")
        XCTAssertEqual(first?.price, 50.00)
        
        
        
        XCTAssertEqual(last?.id, UUID(uuidString: "7747AEF4-575E-4CC9-B168-7DB81EFAA119"))
        XCTAssertEqual(last?.title, "Charity Gala")
        XCTAssertEqual(last?.price, 100)
        

    }
}
