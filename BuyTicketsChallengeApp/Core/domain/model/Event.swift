//
//  Event.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 09/05/2023.
//

import Foundation

struct Event: Decodable {
    // swiftlint: disable line_length
    static var mock: Event = Event(title: "Event name",
                                   description: "Event description, long long long long long long long long long long long long long long long long usually", date: Date.now, price: 45, address: "Strange street 25", contactPhone: "546-005-06")
    var id: UUID?
    var title: String
    var description: String
    var date: Date
    var price: Float
    var address: String
    var contactPhone: String
}
