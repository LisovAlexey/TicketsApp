//
//  EventsRequestMock.swift
//  BuyTicketsChallengeAppTests
//
//  Created by Alexey Lisov on 09/05/2023.
//


import Foundation
@testable import BuyTicketsChallengeApp

enum EventsPreviewRequestMock: RequestProtocol {
    case getEvents
    
    var requestType: RequestType {
        return .GET
    }
    
    var path: String {
        guard let path = Bundle.main.path(forResource: "EventsPreviewListMock", ofType: "json") else {
            fatalError("No EventsPreviewListMock")
        }
        
        return path
    }
}
