//
//  BuyTicketRequest.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 11/05/2023.
//

import Foundation


enum BuyTicketRequest: RequestProtocol {
    case buyTicketByEventUUID(uuid: UUID)
    
    var path: String {
        
        switch self {
        case .buyTicketByEventUUID(let uuid):
            return "/api/event/\(uuid)/buy"
        }
        
    }
    
    var requestType: RequestType {

        switch self {
        case .buyTicketByEventUUID:
            return .POST
        }
    }
    
    var cachePolicy: URLRequest.CachePolicy {
        .useProtocolCachePolicy
    }
}
