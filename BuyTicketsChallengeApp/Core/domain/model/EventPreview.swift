//
//  EventPreview.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 09/05/2023.
//

import Foundation

struct EventPreview: Decodable, Identifiable, Hashable {
    
    static var mock: EventPreview =
    EventPreview(title: "Concert in hell",
                 date: Date.init(timeIntervalSince1970: 1_693_968_000),
                 price: 25.5)
    
    var id: UUID?
    
    var title: String
    var date: Date
    var price: Float
    
}
