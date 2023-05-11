//
//  EventDetailsRequest.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 10/05/2023.
//

import Foundation


enum EventsDetailsRequest: RequestProtocol {
    case getEventByUUID(uuid: UUID)
    
    var path: String {
        switch self {
        case .getEventByUUID(let uuid):
            return "/api/event/\(uuid)"
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .getEventByUUID:
            return .GET
        }
    }
}
