//
//  EventRequest.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 09/05/2023.
//

import Foundation

enum EventsRequest: RequestProtocol {
    
    var path: String {
        "/api/events"
    }
    
    var requestType: RequestType {
        .GET
    }
}
