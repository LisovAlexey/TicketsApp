//
//  EventRequest.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 09/05/2023.
//

import Foundation

enum EventsPreviewRequest: RequestProtocol {
    case getEvents
    
    var path: String {
        "/api/events"
    }
    
    var requestType: RequestType {
        .GET
    }
}
