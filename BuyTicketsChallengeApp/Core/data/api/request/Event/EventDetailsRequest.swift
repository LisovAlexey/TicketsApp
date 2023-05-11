//
//  EventDetailsRequest.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 10/05/2023.
//

import Foundation


enum EventsDetailsRequest: RequestProtocol {
    case getEventByUUID(uuid: UUID)
    case buyTicketByUUID(uuid: UUID)
    
    var path: String {
        switch self {
        case .getEventByUUID(let uuid):
            return "/api/event/\(uuid)"
        case .buyTicketByUUID(let uuid):
            return "/api/event/\(uuid)/buy"
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .getEventByUUID:
            return .GET
        case .buyTicketByUUID:
            return .POST
        }
    }
}
